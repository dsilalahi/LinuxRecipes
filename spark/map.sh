def split_words(line):
  return line.split()
  
def create_pair(word):
  return (word, 1)
  
pairs_RDD=text_RDD.flatMap(split_words).map(create_pair)
pairs_RDD.collect()