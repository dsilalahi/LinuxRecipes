#start a spark shell
spark-shell

# from local filesystem
text_RDD = sc.textFile("file:///home/xxx/testfile")

# from HDFS  
text_RDD = sc.textFile("/user/xxx/testfile")

# outputs the first line
text_RDD.take(1) 

integer_RDD = sc.parallelize(range(100), 2)
integer_RDD.collect()
integer_RDD.glom().collect()


usersDF = spark.read.json("users.json")
usersDF.printSchema()
usersDF.show()

users = usersDF.take(3)

nameAgeDF = usersDF.select("name","age")
over20DF = usersDF.where("age > 20")



usersDF.write. \
	mode("append"). \
	option("path","/home/mydata"). \
	saveAsTable("my_table")