#start a spark shell
spark-shell

# from local filesystem
text_RDD = sc.textFile("file:///home/xxx/testfile")

# from HDFS  
text_RDD = sc.textFile("/user/xxx/testfile”)