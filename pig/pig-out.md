I'm afraid there isn't a one-liner which does the job,but you can come up with the followings (Pig v0.10.0):

```sql
A = load '/user/hadoop/csvinput/somedata.txt' using PigStorage(',') 
      as (firstname:chararray, lastname:chararray, age:int, location:chararray);
store A into '/user/hadoop/csvoutput' using PigStorage('\t','-schema');
```
When PigStorage takes '-schema' it will create a '.pig_schema' and a '.pig_header' in the output directory. Then you have to merge '.pig_header' with 'part-x-xxxxx' :

1. If result need to by copied to the local disk:

```sh
hadoop fs -rm /user/hadoop/csvoutput/.pig_schema
hadoop fs -getmerge /user/hadoop/csvoutput ./output.csv
```
(Since -getmerge takes an input directory you need to get rid of .pig_schema first)

2. Storing the result on HDFS:
```sh
hadoop fs -cat /user/hadoop/csvoutput/.pig_header 
  /user/hadoop/csvoutput/part-x-xxxxx | 
    hadoop fs -put - /user/hadoop/csvoutput/result/output.csv
```
