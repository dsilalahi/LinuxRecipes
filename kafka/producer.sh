
kafka-console-producer --broker-list broker101:9092 --topic testing


kafka-console-producer \
	--broker-list broker101:9092 \
	--topic testing \
	--property parse.key=true \
	--property key.separator=,




seq 1 100 > numlist
kafka-console-producer \
	--broker-list broker101:9092 \
	--topic two-p-topic < numlist