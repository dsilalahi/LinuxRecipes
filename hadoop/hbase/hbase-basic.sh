# enter HBase Shell:
hbase shell


list # get list of table
describe 'table_name'
count 'table_name', CACHE => 1000

# delete a table
disable 'table_name'
drop 'table_name'

enable 'table_name'

# table specific permissions
user_permission <table>     


grant 'username', 'RWXCA'
# R - represents read privilege.
# W - represents write privilege.
# X - represents execute privilege.
# C - represents create privilege.
# A - represents admin privilege.



status 
status 'simple'
status 'detailed'
version
table_help
whoami



# create table and entries:
create 'customers',{NAME=>'username'},{NAME=>'fullname'},{NAME=>'group'}

put 'customers','r1','username','ljames'

put 'customers','r2','username','msharapova'

put 'customers','r3','username','dwade'

put 'customers','r1','fullname','Lebron James'

put 'customers','r2','fullname','Maria Sharapova'

put 'customers','r3','fullname','Dwayne Wade'

put 'customers','r1','group','web'

put 'customers','r2','group','web'

put 'customers','r3','group','direct'

# check entries:
scan 'customers'

# select "fullname" column:
scan 'customers',{COLUMNS=>'fullname'}

# quit HBase shell:
exit