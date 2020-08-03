# Spark
A fast and general compute engine for Hadoop data. Wide range of applications – ETL, Machine Learning, stream processing,and graph analytics.


## why Spark? 
- M/R forces your pipeline into Map and Reduce steps
- M/R reads from disk for each MapReduce job
- M/R supports only native JAVA programming interface


```python
 # from PySpark console
integer_RDD = sc.parallelize(range(100), 2)
integer_RDD.collect()
integer_RDD.glom().collect()
```

```python
# from local filesystem
text_RDD = sc.textFile("file:///home/xxx/testfile")  

# from HDFS
text_RDD = sc.textFile("/user/xxx/testfile")

# outputs the first line
text_RDD.take(1) 
```

```python
def split_words(line):
  return line.split()
  
def create_pair(word):
  return (word, 1)
  
pairs_RDD=text_RDD.flatMap(split_words).map(create_pair)
pairs_RDD.collect()
```

```python
def sum_counts(a, b):
  return a + b

wordcounts_RDD = pairs_RDD.reduceByKey(sum_counts)
wordcounts_RDD.collect()
```

## Transformations
- RDD are immutable
- Never modify RDD in place
- Transform RDD to another RDD
- Lazy
