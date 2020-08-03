# list of topics
kafka-topics --zookeeper localhost:2181 --list

# create a topic w/ 3 partitions
kafka-topics --zookeeper localhost:2181 --create \
	--topic topic-name \
	--partitions 3 \
	--replication-factor 1 \
	--if-not-exists


# create output log compacted topic
kafka-topics --create --zookeeper localhost:2181 \
	--replication-factor 1 \
	--partitions 1 \
	--topic topic-name \
	--config cleanup.policy=compact

# delete a topic
kafka-topics --delete --zookeeper localhost:2181 --topic {topic-name} --if-exists

# open a shell - zookeeper is at localhost:2181
bin/zookeeper-server-start.sh config/zookeeper.properties

# open another shell - kafka is at localhost:9092
bin/kafka-server-start.sh config/server.properties

# get a list of brokers
zookeeper-shell localhost:2181 <<< "ls /brokers/ids"

kafka-run-class kafka.tools.ConsumerOffsetChecker
kafka-run-class kafka.tools.VerifyConsumerRebalance
kafka-run-class kafka.tools.KafkaMigrationTool

kafka-run-class kafka.tools.DumpLogSegments --print-data-log --files 00000000000000000000.log
kafka-run-class kafka.tools.DumpLogSegments --files 00000000000000000000.index


# package your application as a fat jar
mvn clean package

# run your fat jar
java -jar <your jar here>.jar


# get Confluent ControlCenter process
sudo jps | grep -i ControlCenter