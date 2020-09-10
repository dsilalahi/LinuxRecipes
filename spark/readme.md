# Spark
A fast and general compute engine for Hadoop data. Wide range of applications – ETL, Machine Learning, stream processing,and graph analytics.


## why Spark? 
- M/R forces your pipeline into Map and Reduce steps
- M/R reads from disk for each MapReduce job
- M/R supports only native JAVA programming interface

## Broadcast variables
- example: lookup table or configuration dictionary
- large variable used in across nodes
- transfer just once per executor
- efficient peer-to-peer transfer

## Transformations
- RDD are immutable
- Never modify RDD in place
- Transform RDD to another RDD
- Lazy


### Spark shell options
- master: specify the cluster to connect to
- jars: Additional JAR files (Scala only)
- py-files: Additional Python files (Python only)
- name: the name the Spark Application UI uses for this application
- Defaults to PySparkShell (Python) or Spark shell (Scala) help: Show all the available shell options



### Some common DataFrame actions include
- count: returns the number of rows
- first: returns the first row (synonym for head())
- take(n): returns the first n rows as an array (synonym for head(n)) 
- show(n): display the first n rows in tabular form (default is 20 rows) 
- collect: returns all the rows in the DataFrame as an array
- write: save the data to a file or other data source



### Common transformations include
- select: only the specified columns are included
- where: only rows where the specified expression is true are included (synonym for filter)
- orderBy: rows are sorted by the specified column(s) (synonym for sort) 
- join: joins two DataFrames on the specified column(s)
- limit(n): creates a new DataFrame with only the first n rows