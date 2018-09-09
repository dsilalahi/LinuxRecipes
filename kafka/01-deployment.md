## Components
- Zookeeper (min 3 in prod)
- Kafka (min 3 in prod)
- App: Java, C#, GO, Python, Connectors, Connect
  - REST Proxy
  - Streams apps
  - Schema Registry (2 nodes for HA)

Proprietary (Confluent)
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

Planning

Scaling

Resources

### Storage
How Much? | Hardware | Configuration | Partitions
--- | --- | --- | --- 
Kafka: Throughput * Retention (+ 30% for indices) | Are SSDs worth it? | RAID vs JBOD | Per Topic
ZooKeeper: very little (< 1GB has to be High Perf) | Is shared storage ok? | XFS or EXT4 | Per Broker
Control Center: Lots (500+ GB) | | Zookeeper log | Total
Streams: it is complicated (join windows, unique keys). lots of space and monitor the growth | | |
