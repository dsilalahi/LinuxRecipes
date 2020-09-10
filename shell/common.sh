
# count # of files recursively
find <dir_name> -type f | wc -l

# count # of lines in a file
cat <filename> | wc -l
head -n 5 filename.txt
tail -n +2 filename.txt


# find java
find -name "*.java" -exec cat {} \;

# get a list of users
cut -d: -f1 /etc/passwd

# environment of a given shell
env 


curl --request GET --url https://www.example.com/api/v1/hello


# LINUX
# ===============================
# processor info
cat /proc/cpuinfo
cat /proc/cpuinfo | grep proc

# see system file
cat /etc/fstab

# memory info
cat /proc/meminfo | grep Mem
free -h

# check memory usage
free -m

ls -l # human readable format
ls -ltr	# sort file as per last modified time.


# host lookup ex. ns = nameserver
host -t ns hostname.com

# local DNS info
cat /etc/resolv.conf

# query Internet domain name servers
nslookup [-option] [name | -] [server]

# DNS related information like A Record, CNAME, MX Record etc
dig [@server] [-b address] [-c class] [-f filename] [-k filename] [-m]
           [-p port#] [-q name] [-t type] [-v] [-x addr] [-y [hmac:]name:key] [-4]
           [-6] [name] [type] [class] [queryopt...]


uptime
users
w # list every user that is currently logged in
who
whoami
crontab
last
ps -rf | grep init

ssh
ftp
sftp
service

tar -cvf ...tar /host
tar -xvf ...tar

grep parsley /etc/passwd
find / -name parsley

# network interface configuration
ifconfig
ifconfig eth0 - promisc  # promiscuous mode it will received all the packets.
ifstat --scan=SECS # read and monitor various network interface statistics like bandwidth usage, and so on

mail -s "This is the subject" user@example.com < mail.txt
mail -s "Subject" -a /tmp/file.pdf user@example.com < mail.txt


traceroute # number of hops taken to reach destination
netstat # display connection info, routing table information etc
route # view routing table
host # to find IP from a host name
