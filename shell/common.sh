
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