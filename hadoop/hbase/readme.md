# HBase

Reference Guide:
http://hbase.apache.org/book.html#arch.overview

klist  –kte  /PATH/TO/keytab


Monitoring HBase
- Region Servers
	- numRegionServers
	- numDeadRegionServers
- Regions-in-Transition (is data available?)
	- ritOldestAge
	- ritCountOverThreshold
	- ritCount
- HDFS Performance
	- FsReadTime
	- FsPReadTime
	- FsWriteTime
- Exceptions

Monitoring Queries
- Reads
	- GET vs SCAN
	- Size
	- Hotspot?
	- Cache Hits, Stores, Queue Call vs Process Call Time
- Mutations
	- MemStore Size
	- StoreFile Size and Count
- Granularity
	- Users
	- Regions
	- Tables
	- Region-Server
	- Cluster-Wide