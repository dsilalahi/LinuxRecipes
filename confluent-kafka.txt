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





