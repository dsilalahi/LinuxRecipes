import os
import csv
import pandas as pd
import numpy as np

cwd = os.environ["PWD"]
outDir = cwd + '/outHQL'
if not os.path.exists(outDir):
	os.makedirs(outDir)

def strip(text):
    try:
        return text.strip().lower()
    except AttributeError:
        return text
        
def make_int(text):
    return int(text.strip('" '))
# Create a dictionary for converting DB2 to Hive types
types = {
  # Strings 
  'character' : 'char',
  'varchar' : 'varchar',
  'clob' : 'string',
  'blob': 'varchar',
    # '' : 'char',
  # Numeric
  'smallint' : 'smallint',
  'bigint': 'bigint',
  'integer' : 'int',
  'int' : 'int',
  'decimal' : 'decimal',
  'numeric': 'decimal',
  'real' : 'float',
  'double' : 'double',
  # Also double precision
  # 'dec' : 'char',
  'binary' : 'binary',
  'date' : 'date',
  'timestamp': 'timestamp',
  'time': 'time',
  'xml': 'string'
  
}

# List of Hive data types:
# Ints: tinyint, smallint, int, bigint
# Strings: varchar, char
# Time: time

# Read in the data file prepared in getTabData.py
# df = pd.read_csv('tabCol.csv')


df = pd.read_csv(cwd+'/tabCol.csv',sep=r',',
    header = 0,names = ["COLNO", "TABNAME", "TABSCHEMA", "COLNAME", "TYPENAME", "LENGTH","SCALE"],
    converters = {'COLNO':make_int,
                  'TABNAME':strip,
                  'TABSCHEMA':strip,
                  'COLNAME':strip,
                  'TYPENAME':strip,
                  'LENGTH':strip,
                  'SCALE':strip})

# Loop across unique SCHEMANAME & TABNAME
schemas = df.TABSCHEMA.unique()
 # schemas.size
for i in range(0, schemas.size):
  sub_sch = df[df.TABSCHEMA == schemas[i]]
  schDir = outDir + '/' + schemas[i]
  if not os.path.exists(schDir):
		os.makedirs(schDir)
  tables = sub_sch.TABNAME.unique()
 # Loop across TABNAME (sorted by COLNO)
 # tables.size
  for j in range(0, tables.size):
   sub_tab = sub_sch[sub_sch.TABNAME == tables[j]].sort_values("COLNO")
   out_lst = []
   out_lst.append('use [dbname]')
   out_lst.append('drop table if exists [dbname].' + schemas[i] + '_' + tables[j])
   out_lst.append('create external table [dbname].' + schemas[i] + '_' + tables[j] + '(')
   
   # Logic to map types & sizes
   for cols in range(0, sub_tab.shape[0]):
     endStr = ','
     if (int(sub_tab.LENGTH.iloc[cols]) > 0):
       endStr = '(' + sub_tab.LENGTH.iloc[cols] 
     if (int(sub_tab.SCALE.iloc[cols]) > 0):
       endStr = endStr + ',' + sub_tab.SCALE.iloc[cols]
     out_lst.append(sub_tab.COLNAME.iloc[cols] + ' ' +types[sub_tab.TYPENAME.iloc[cols]] + endStr + '),')
   out_lst.append(')')
   out_lst.append("row format delimited fields terminated by ','")
   out_lst.append("lines terminated by '\\n'")
   out_lst.append("stored as text")
   out_lst.append("location '/target/folder/" +schemas[i] + "_" + tables[j] + "_m")
   outFile = open(schDir + '/create_' + schemas[i] + '_' + tables[j] + '.hql', 'w')
   # writer = csv.writer(csvfile)
   for item in out_lst:
     outFile.write("%s\n" % item)
   outFile.close()
