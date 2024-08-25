# AWS Kinesis Stream

1 shard
- 1 MB/sec data input
- 2 MB/sec data output
- 5 trans/sec for reads
- 1000 recs/sec for writes

record: unit of data stored in a stream
- partition key
	- group the data by shard
	- which shard the data belongs to 
	- specified by the apps putting the data into a stream
- sequence #
	- uid for a data blob
	- assigned when a producer calls PutRecord or PutRecords operations to a
- data blob
	- max size: 1M (base64-decoding)

Retention Period
- default - 24 hrs
- can be modified via CLI to 7 days 

## Data Producers
- Amazon Kinesis Streams API
	- AWS SDK for Java
	- PutRecord (single data record)
	- PutRecords (multiple data records)
- Amazon Kinesis Producer Library (KPL)
	- Configurable library to create producer apps that allow devs to achieve high write throughput to a Kinesis Stream
	- Write to one or more Kinesis Streams with an auto-retry configurable mechanism
	- Collects records to write multiple records to multiple shards per request — collection is working with groups of Streams records and batching them to reduce HTTP requests
	- Aggregate user records and streams records (batching)
	- Kinesis Client Library (KCL) integration to de-aggregate records
	- logs to CloudWatch for monitoring - Stream, Shard, Producer levels
	- DO NOT use KPL if…
		- Your producer app/use case cannot incure an addtl processing delay
		- RecordMaxBufferedTime			- Maximum amount of time a record spends being buffered
		- Larger values result in better perf, but can delay records
		- Setting RecordMaxBufferedTime too low can negatively impact throughput
- Amazon Kinesis Agent
	- can be installed in Web Servers, Log Servers, Database Servers
	- can monitor multiple directories and write to multiple streams
	- can pre-process data e.g., multi-line to single line, convert from delimiter to JSON format, log to JSON format

## Data Consumers
- Apps using Kinesis Client Library (KCL)
	- KCL consume and process data
	- KCL handles complex tasks — load balancing across instances, checkpointing (track) processed records, reacting to re-sharding operation
	- can be written in Java, Node.js, .NET, Python and Ruby
- Uses unique DynamoDB table for each app to track application state
- So use uniquec application names in KCL
- Each row in the DynamoDB table represents a shard
- Hash key for the DynamoDB table is the shard ID
- DynamoDB table throughput
	- 10 read/write capacity units
	- Provisioned throughput exceptions if
		- app does frequent checkpointing
		- stream has too many shards
		- consider adding more provisioned throughput to the DynamoDB table
