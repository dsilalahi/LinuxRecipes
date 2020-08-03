kafka-console-consumer \
	--bootstrap-server broker101:9092 \
	--from-beginning \
	--topic output-topic \
	--from-beginning

kafka-console-consumer \
	--bootstrap-server broker101:9092 \
	--from-beginning \
	--topic output-topic \
	--property print.key=true


# list of consumer groups
kafka-consumer-groups --new-consumer --bootstrap-server localhost:9092 --list



# start a consumer on the output topic
kafka-console-consumer --bootstrap-server localhost:9092 \
    --topic output-topic \
    --from-beginning \
    --formatter kafka.tools.DefaultMessageFormatter \
    --property print.key=true \
    --property print.value=true \
    --property key.deserializer=org.apache.kafka.common.serialization.StringDeserializer \
    --property value.deserializer=org.apache.kafka.common.serialization.LongDeserializer

