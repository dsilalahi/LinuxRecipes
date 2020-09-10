def sum_counts(a, b):
  return a + b

wordcounts_RDD = pairs_RDD.reduceByKey(sum_counts)
wordcounts_RDD.collect()