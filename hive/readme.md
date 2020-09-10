# Hive

configs/properties
```sh
hive> set dfs.block.size;  (default 64MB)
hive> set parquet.block.size;  (same as dfs)
hive> set hive.default.fileformat; 
hive> set hive.mapred.mode;
hive> set hive.groupby.orderby.position.alias;
hive> set mapred.reduce.tasks;  (can be hardcoded)
hive> set hive.exec.reducers.bytes.per.reducer; (default 256 MB)
hive> set hive.exec.reducers.max;
hive> set mapred.map.tasks.speculative.execution;
hive> set mapred.reduce.tasks.speculative.execution;
hive> set hive.enforece.bucketing;
hive> set hive.auto.convert.join=true;
hive> set hive.merge.mapfiles;
hive> set hive.merge.mapredfiles;
hive> set hive.merge.size.per.task;
hive> set hive.merge.smallfiles.avgsize;
hive> set mapred.compress.map.output;   # compress map output
hive> set mapred.map.output.compression.codec;  # snappy, gzip, bzip2, lzo
hive> set mapred.output.compress=true; # to enable compression
```



Vectorized query execution improves performance of operations like scans, aggregations, filters and joins, by performing them in batches of 1024 rows at once instead of single row each time.

```sh
set hive.vectorized.execution.enabled = true;
set hive.vectorized.execution.reduce.enabled = true;
```


A recent addition to Hive, Cost-based optimization, performs further optimizations based on query cost, resulting in potentially different decisions: how to order joins, which type of join to perform, degree of parallelism and others.

```sh
set hive.cbo.enable=true;

set hive.compute.query.using.stats=true;

set hive.stats.fetch.column.stats=true;

set hive.stats.fetch.partition.stats=true;
```

Modes in Hive
* Embedded - metastore service runs in the same JVM as Hive serivce (derby db)
* Local - metastore service runs in the same JVM as Hive serivce; derby database runs on a separate JVM service; metastore connects to DB via JDBC
* Remote - metastore service runs on its own seperate JVM; metastore and DB run on their own services


## Performance
- use ORC (Optimized Row Columnar) file format
- use Tez execution engine (on top of YARN)
