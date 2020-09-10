## Performance Considerations

STRAIGHT_JOIN technique
- Specify the largest table first
- Next, specify the smallest table. The contents of the second, third, and so on tables are all transmitted across the network. 
- Join the next smallest table, then the next smallest, and so on.


- Broadcast joins are the default, where the right-hand table is considered to be smaller than the left-hand table, and its contents are sent to all the other nodes involved in the query.
- partitioned join (not related to a partitioned table), which is more suitable for large tables of roughly equal size. With this technique, portions of each table are sent to appropriate other nodes where those subsets of rows can be processed in parallel. 
- The choice of broadcast or partitioned join also depends on statistics being available for all tables in the join, gathered by the COMPUTE STATS statement.



```sh
set explain_level=verbose;
explain select count(*) from big join medium where big.id = medium.id;


# get compute stats for each table
# issue the COMPUTE STATS statement after loading the data into that tabl
compute stats small;
```