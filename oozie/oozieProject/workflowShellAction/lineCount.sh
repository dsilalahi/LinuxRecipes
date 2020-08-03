#!/bin/bash -e

# usage: lineCount 'fully qualified file name'
echo "NumberOfLines=`hadoop fs -cat $1 | wc -l`"
