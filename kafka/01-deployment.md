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
