

distinctRDD = sc.\
	textFile("cities1.csv").distinct()

for city in distinctRDD.collect(): \
	print city


Boston,MA
Palo Alto,CA
Santa Fe,NM

unionRDD = sc.textFile("cities2.csv"). \
	union(distinctRDD)

for city in unionRDD.collect(): \
	print city


Calgary,AB
Chicago,IL
Palo Alto,CA
Boston,MA
Palo Alto,CA
Santa Fe,NM