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