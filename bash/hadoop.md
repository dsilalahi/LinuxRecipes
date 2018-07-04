

```
hdfs dfs -ls /

hdfs dfs -ls /user

hdfs dfs -mkdir /{dir name}

hdfs dfs -put {local folder} /{dir name}/

hdfs dfs -get /{remote folder} /{local folder}

hdfs dfs -ls /{dir name}/

hdfs dfs -cat /loudacre/kb/KBDOC-00289.html | head -n 20
```


```
yarn application -list # List running applications

yarn application -kill app-id  # Kill a running application

yarn logs -applicationId app-id # View the logs of the specified application

yarn -help # View the full list of command options
```