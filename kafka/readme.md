# Kafka

## Deployment 
### Components
- Zookeeper (min 3 in prod)
- Kafka (min 3 in prod)
- App: Java, C#, GO, Python, Connectors, Connect
  - REST Proxy
  - Streams apps
  - Schema Registry (2 nodes for HA)


## Proprietary (Confluent)
  - Control Center
  - Replicator
  - ADB -- automatic data balancer

### State on local disk
  - streams apps
  - Kafka
  - ZooKeeper
  - Control Center

### State in Kafka
  - Schema Registry
  - Connect
  - Connectors
  - Replicator
  - Java app
  - Python app
  - C# app
  - Go app
  
### Stateless - No Storage
  - REST Proxy
  - ADB


### Special Considerations for Clouds
- virtual cores are relatively weak
- network is typically weak
- shared storage is typically awesome


#### Storage
How Much? | Hardware | Configuration | Partitions
--- | --- | --- | --- 
Kafka: Throughput * Retention (+ 30% for indices) | Are SSDs worth it? not really | RAID (still recommended) vs JBOD | Per Topic (driven by consumption throughput)
ZooKeeper: very little (< 1GB has to be High Perf) | Is shared storage ok? discouraged | XFS (better out of the box) or EXT4 both are good | Per Broker (4000 partition is pushing it)
Control Center: Lots (500+ GB) | | Zookeeper log | Total
Streams: it is complicated (join windows, unique keys). lots of space and monitor the growth | | |

#### Memory
Item | Page Cache | JVM Heap | Off Heap Memory
--- | --- | --- | ---
ZooKeeper | | 1-4 GB | 
Kafka | the more the merrier | # partitions * max fetch + compaction buffer ~10% | 
Kafka Connect | | # tasks * # partitions * memory buffer per partition | 
Kafka Streams | | 10 GB Buffer Cache + 1 MB per partition or 50 MB per broker = ~ 32 GB | Rocks DB
Rest Proxy | | ~1GB | 
Schema Registry | | ~1GB | 
Clients | | Java client - batching and retries | other clients - batching and retries
Control Center | | it is a strems app ... 32GB | it is a streams app ... 



### Kafka Streams
* Stream - <null, “Dohar Dohar Sialahi”>
* MapValues lowercase - <null, “dohar dohar silalahi”>
* FlatMapValues split by space - <null, “dohar”>, <null, “dohar”>, <null, “silalahi”>
* SelectKey to apply a key - <“dohar”, “dohar”>, <“dohar”, “dohar”>, <“silalahi”, “silalahi”>
* GroupByKey before aggregation - (<“dohar”, “dohar”>, <“dohar”, “dohar”>), (<“silalahi”, “silalahi”>)
* Count occurence in each group - <“dohar”, 2>, <“silalahi”, 1>
* To in order to write data back to kafka

#### Naming Conventions

- Avoid topic names based on things that change
- Avoid topic names based on information that would be stored in other places
- Avoid topic names based on their planned consumers/producers. This is essentially a special case of the first advice.
- Decide casing early on, and consider enforcing it or at least check/monitor it. This way you catch offenders early on.

<message type>.<dataset name>.<data name>

Message Type ex:
logging - For logging data (slf4j, syslog, etc)
queuing - For classical queuing use cases.
tracking - For tracking events such as user clicks, page views, ad views, etc.
etl/db - For ETL and CDC use cases such as database feeds.
streaming - For intermediate topics created by stream processing pipelines.
push - For data that’s being pushed from offline (batch computation) environments into online environments.
user - For user-specific data such as scratch and test topics.

