```
kafka-topics --zookeeper localhost:2181 --list
kafka-configs --describe --zookeeper localhost:2181 --entity-type brokers

kafka-topics --zookeeper localhost:2181 --create --topic {topic-name} --partitions 3 --replication-factor 1 --if-not-exists
kafka-topics --zookeeper localhost:2181 --describe --topic {topic-name}
kafka-topics --delete --zookeeper localhost:2181 --topic {topic-name} --if-exists

kafka-consumer-groups --new-consumer --bootstrap-server localhost:9092 --list

kafka-run-class kafka.tools.DumpLogSegments --print-data-log --files 00000000000000000000.log
kafka-run-class kafka.tools.DumpLogSegments --files 00000000000000000000.index

kafka-run-class kafka.tools.ConsumerOffsetChecker
kafka-run-class kafka.tools.VerifyConsumerRebalance
kafka-run-class kafka.tools.KafkaMigrationTool
zookeeper-shell localhost:2181 <<< "ls /brokers/ids"
```


```sh
$ sudo jps # listing java processes

# producer
$ kafka-console-producer --broker-list broker101:9092 --topic testing
$ kafka-console-producer \
--broker-list broker101:9092 \
--topic testing \
--property parse.key=true \
--property key.separator=,


# consumer
$ kafka-console-consumer \
--bootstrap-server broker101:9092 \
--from-beginning \
--topic testing

$ kafka-console-consumer \
--bootstrap-server broker101:9092 \
--from-beginning \
--topic testing \
--property print.key=true

```sh


$ zookeeper-shell zookeeper1

# from zookeeper-shell
ls /
ls /brokers
ls /brokers/ids

#######################################################################################
# create kafka topics to 2 partitions
$ kafka-topics \
--zookeeper zookeeper1:2181 \
--create \
--topic two-p-topic \
--partitions 2 \
--replication-factor 1

# command-line Producer to write several lines of data to the Topic.
$ seq 1 100 > numlist
$ kafka-console-producer \
--broker-list broker101:9092 \
--topic two-p-topic < numlist

# commmand-line Consumer to read the Topic
$ kafka-console-consumer \
--bootstrap-server broker101:9092 \
--from-beginning \
--topic two-p-topic


# #######################################################################
$ sudo connect-distributed -daemon /etc/kafka/connect-distributed.properties
$ kafka-topics \
--zookeeper zookeeper1:2181 \
--create \
--topic shakespeare_years \
--partitions 1 \
--replication-factor 1
Created topic "shakespeare_years".

$ echo "SELECT * FROM years;" | sqlite3 /usr/local/lib/my.db

$ confluent_control_center_hard_reset.sh
$ sudo jps | grep -i ControlCenter


$ echo "INSERT INTO years(name,year) VALUES('Tempest',1611);" | \
sudo sqlite3 /usr/local/lib/my.db
$ echo "INSERT INTO years(name,year) VALUES('King Lear',1605);" | \
sudo sqlite3 /usr/local/lib/my.db


URL
==================
https://docs.confluent.io/current/kafka/monitoring.html
https://docs.confluent.io/current/control-center/docs/userguide.html


