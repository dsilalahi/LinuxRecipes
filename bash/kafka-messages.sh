#!/bin/bash
# eda-qa.sh 
# this script is for QA purposes

# usage statements (main menu)
# =============================================
usage() {
	case $1 in
		"")
			echo ""
			echo "Usage: eda-qa.sh [-b 10.xxx.xxx.xxx] [-h|--help]"
			echo ""
			echo "  This is a quick example of getting EDA topics info with bash"
			echo "  The kafka scripts are hard-coded in the body"
			echo ""
			echo "Params:"
			echo "      -h|--help: print this help info and exit"
			echo "      -b|--broker: default is 10.xxx.xxx.xxx"
      			echo "      -c|--count: get the number of messages for each topic"
			echo "Examples:"
			echo ""
			echo "		./eda-qa.sh -b 10.xxx.xxx.xxx"
			echo "		./eda-qa.sh -c"
			echo ""
			;;
		
	esac
	exit
}

# receive command line arguments to invoke a specific function
args() {
	run_eda_qa $@
}

run_eda_qa() {
	# init params	
	broker="10.236.3.129"
	count=0
		
	# process args for this block
	while test $# -gt 0
	do
    	case $1 in
    		-b|--broker)
            		shift
            		broker=$1
            		;;
            	-c|--count)
            		shift
            		count=1
            		;;
        	-h|--help)
            		usage
            		;;
        	*)
            	echo >&2 "Invalid argument: $1"
            	usage
        	;;
    	esac
    	shift
	done
	
	# execute message_count for all the topics
	
	if [ $count -eq 1 ]; then
		message_count $broker "grs_sync_event_con_int_dc4" "Ingestion"
		message_count $broker "grs_sync_eventeda_pmsp1_intdc4" "Priority-1"
		message_count $broker "grs_sync_eventeda_pmsp2_intdc4" "Priority-2"
		message_count $broker "grs_sync_eventeda_pmsp3_intdc4" "Priority-3"
		message_count $broker "grs_sync_eventeda_pmsp4_intdc4" "Priority-4"
		message_count $broker "grs_sync_eventeda_other_intdc4" "Other"
		# add more topics as needed
    		echo "Last execution time: `date`.";
	fi
	
	exit	
}

# gets the # of messages for a specific topic across multiple partitions
message_count() {
	broker_ip=$1
	tp_name=$2
	f_name=$3
	
	sum=$(kafka-run-class kafka.tools.GetOffsetShell --broker-list $broker_ip:9092 --topic $tp_name --time -1 --offsets 1 | awk -F ":" '{sum += $3} END {print sum}')	
	
	echo "# of $f_name messages = "$sum
}

# trap CTRL+C, CTRL+Z and quit singles
trap '' SIGINT SIGQUIT SIGTSTP

# ----------------------------------------------------
# start of script execution
# 
args $@
