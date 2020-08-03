# get a list files and directories in HDFS
hdfs dfs -ls /{dir_name}
hdfs dfs -ls /user

# create a directory in HDFS
hdfs dfs -mkdir /{dir name}

# copy a folder in local folder into HDFS
hdfs dfs -put {local folder} /{dir name}/

# copy a folder in HDFS to local folder
hdfs dfs -get /{remote folder} /{local folder}

# printout a file in HDFS
hdfs dfs -cat /{dir_name}/{sub-dir}/sample-file.csv | head -n 20

# file system check
hdfs fsck /dir/hadoop-test -files -blocks –locations