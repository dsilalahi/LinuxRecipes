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