## Zookeeper

- dist. configuration mgmt
- self election / consensus building
- coordination and locks
- key value store

/
	/app
		/app/finance
		/app/sales

* internal data structure is like a tree
* each node is called a zNode
* each zNode has a path
* zNode can be persistent or ephemeral
* each zNode can store data
* each zNode can be watched for changes



### Roles in Kafka:
- brokers registrations, with heartbeats mechanisms to keep the list current
- maintaining a list of topics along side:
    - their configs
    - list of ISRs
- performing leader elections in case some brokers go down
- storing the kafka cluster id
- storing ACLs: topics, consumer groups and users
- quotas config if enabled