# AWS EMR

Note: EMR is a single AZ service


## High level architecture
- Master
	- manages the resources, schedules jobs on Core and Task Nodes
	- tracks and directs against HDFS
	- monitors the health of the Core and Task nodes
- Nodes are categorized into Instance Groups (EC2 instances)
	- EMR cluster can have upto 50 instance groups - 1 Master IG, 2 Core IGs, 48 Task IGs
- Core Nodes: slave nodes
	- run tasks
	- store data as part of HDFS or EMRFS
	- datanode daemon
	- NodeManager
	- ApplicationMaster
	- “Shrink” operation
- Task Nodes: slave nodes
	- Optional
	- No HDFS
	- Added and removed from running clusters
	- Extra capacity

HDFS block size: 64 MB (default)
	- Replication factor - hdfs-site.xml

```sh
$hadoop fs -ls
$hadoop fs -stat %r defaultblock.txt
$hadoop fs -setrep -R -w 2 defaultblock.txt
```

### Storage Options
- Instance Store
	- High I/O perf
	- High IOPS at low cost
	- D2 and I3
- EBS for HDFS
- EMR File System (EMRFS)
	- HDFS on S3
	- Reliability, durability and scalability of S3
	- resize and terminate EMR clusters without losing data
	- multiple clusters to point to the same EMRFS
	- can use EMRFS and HDFS together
	- copy data from S3 to HDFS using S3DistCp