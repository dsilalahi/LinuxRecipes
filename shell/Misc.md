```sh
# check memory usage
$ free -m
```

```sh
# count # of files recursively
find <dir_name> -type f | wc -l

# count # of lines in a file
cat <filename> | wc -l

# find java
find -name "*.java" -exec cat {} \;
```


cut -d: -f1 /etc/passwd