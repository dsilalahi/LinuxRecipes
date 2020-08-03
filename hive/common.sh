# connect to beeline
beeline -u jdbc:hive2://

# to exit out of beeline:
!q

# invoke sql from cli
hive -e ‘select * from …’

# invoke sql from a file
hive -f ‘/home/location/query.hql’

