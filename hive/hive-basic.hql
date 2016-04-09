-- copy file into HDFS and start beeline
hdfs dfs -put /source/folder/ /target/folder

beeline -u jdbc:hive2://

-- run HIVE commands:
CREATE TABLE customers ( fname STRING, lname STRING, uid INT, bid INT, type STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE;

-- load data into customers table
LOAD DATA INPATH '/target/folder' OVERWRITE INTO TABLE customers;

SELECT * FROM customers ORDER BY fname;

-- to exit out of beeline:
!q