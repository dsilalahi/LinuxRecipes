#!/bin/bash
# run_compare.sh


# this will print the usage statements and exit
usage() {
	case $1 in
		"")
			echo ""
			echo "Usage: run_compare.sh [-l /my/log/file.txt] [-c run_count] [-h|--help]"
			echo ""
			echo "  This is a quick example of comparing some hive queries to different tables  with bash"
			echo "     The queries and tables are hard coded in the script"
			echo ""
			echo "Params:"
			echo "      -c|--count run_count: default is 10"
			echo "      -h|--help: print this help info and exit"
			echo "      -l|--logfile: default is run_compare.csv in execution dir"
			echo "Examples:"
			echo ""
			echo "		./run_compare.sh -c 100 -l myfile.csv"
			echo ""
			;;
		
	esac
	exit
}

# this will process command line arguments enough 
# to get you to a specific function
args() {
	run_compare $@
}

run_compare() {
	# init params
	database="bikes"
	table_entensions="null rc orc1 orc2"
	count=10
	logfile="run_compare.csv"
	row_count=""
	start_time=""
	end_time=""
	my_value=""
	my_query=""
	name=""

	# process args for this block
	while test $# -gt 0
	do
    	case $1 in
    		-l|--logfile)
            	shift
            	logfile=$1
            	;;
            -c|--count)
            	shift
            	count=$1
            	;;
        	-h|--help)
            	usage pull_with_one_liner
            	;;
        	*)
            	echo >&2 "Invalid argument: $1"
            	usage ""
        	    ;;
    	esac
    	shift
	done
	
	# clean out data from existing log file
	cat /dev/null > $logfile
	
	# execute comparison for specified count
	c=0
	while test $c -lt $count
	do
		let c++
		echo "running round $c"
		for ext in $table_entensions; do
			if [ "$ext" = "null" ]; then
				ext=""
				name="text"
			else
				name=$ext
				ext="_$ext"
			fi
			
			echo "round $c: table group $name" 
			
			# execute Query1
			my_query_name="Query1"
			my_query="set mapred.reduce.tasks=30;"
			my_query="$my_query use $database;"
			my_query="$my_query SELECT a.start_date, a.bike_nr, a.duration, b.start_station_id, b.start_latitude, b.start_longitude, b.stat_station, c.end_station_id, c.end_latitude, c.end_longitude, c.end_station"
			my_query="$my_query FROM (SELECT duration, bike_nr, start_date, cast(split(trips$ext.start_station, '/')[4] as int) as start_station, cast(split(trips$ext.end_station, '/')[4] as int) as end_station FROM trips$ext) a"
			my_query="$my_query JOIN (SELECT id as start_station_id, longitude as start_longitude, latitude as start_latitude, name as stat_station FROM stations$ext) b ON a.start_station = b.start_station_id"
			my_query="$my_query JOIN (SELECT id as end_station_id,longitude as end_longitude, latitude as end_latitude, name as end_station FROM stations$ext) c ON a.end_station = c.end_station_id"
			
			start_time=`date "+%s"`
			my_value=$(hive -S -e "$my_query")
			end_time=`date "+%s"`
			r_count=`echo "$my_value"| wc -l`
			log_it $logfile $name $start_time $end_time $my_query_name "$r_count" "$my_query" 
			
			
			# execute Query 2
			my_query_name="Query2"
			my_query="set mapred.reduce.tasks=30;"
			my_query="$my_query use $database;"
			my_query="$my_query SELECT a.bike_nr, sum(a.duration)"
			my_query="$my_query FROM (SELECT duration, gender, subscription_type, status, bike_nr, start_date, cast(split(trips$ext.start_station, '/')[4] as int) as start_station, cast(split(trips$ext.end_station, '/')[4] as int) as end_station FROM trips$ext) a"
			my_query="$my_query JOIN (SELECT id as start_station_id, longitude as start_longitude, latitude as start_latitude, name as stat_station FROM stations$ext) b ON a.start_station = b.start_station_id"
			my_query="$my_query JOIN (SELECT id as end_station_id,longitude as end_longitude, latitude as end_latitude, name as end_station FROM stations$ext) c ON a.end_station = c.end_station_id"
			my_query="$my_query WHERE a.duration > 0"
			my_query="$my_query GROUP BY a.bike_nr"
			
			start_time=`date "+%s"`
			my_value=$(hive -S -e "$my_query")
			#my_value="MyValue"
			end_time=`date "+%s"`
			r_count=`echo "$my_value"| wc -l`
			log_it $logfile $name $start_time $end_time $my_query_name "$r_count" "$my_query"
			
			# execute Query 3
			my_query_name="Query3"
			my_query="set mapred.reduce.tasks=30;"
			my_query="$my_query use $database;"
			my_query="$my_query SELECT s.station_id as station_id, e.end_count as end_count, s.start_count as start_count FROM"
			my_query="$my_query (SELECT a.end_station as station_id, count(a.end_station) as end_count FROM (SELECT cast(split(trips$ext.end_station, '/')[4] as int) as end_station FROM trips$ext) a group by a.end_station) e"
			my_query="$my_query FULL JOIN"
			my_query="$my_query (SELECT b.start_station as station_id, count(b.start_station) as start_count FROM (SELECT cast(split(trips$ext.start_station, '/')[4] as int) as start_station FROM trips$ext ) b group by b.start_station) s"
			my_query="$my_query WHERE e.station_id = s.station_id"
			
			start_time=`date "+%s"`
			my_value=$(hive -S -e "$my_query")
			end_time=`date "+%s"`
			r_count=`echo "$my_value"| wc -l`
			log_it $logfile $name $start_time $end_time $my_query_name "$r_count" "$my_query" 
			
		done
	done
	exit	
}

# pass in logfile, start, end, query_name, result_count, query
# count result set, and log the data to csv file
log_it() {
	log_file=$1
	n=$2
	start_t=$3
	end_t=$4
	q_name=$5
	result_count=$6
	q=$7
		
	let duration=$end_t-$start_t
	time_run=`date -d @$start_t`
	echo "$n,$q_name,\"$time_run\",$duration,$result_count,\"$q\"" >> $log_file
}

# -------------------------------------------------------------------------------------
# Beginning of script execution
#

args $@
