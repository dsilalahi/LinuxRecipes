import getpass
import jaydebeapi
import os
import csv
import pandas
from pandas import DataFrame
import numpy as np
# with open('tabCol.csv', 'wb') as csvfile
#os.environ["USER"]

def WriteListToCSV(csv_file,csv_columns,list_data):
    try:
        with open(csv_file, 'w') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(csv_columns)
            for data in list_data:
                writer.writerow(data)
    except IOError as (errno, strerror):
            print("I/O error({0}): {1}".format(errno, strerror))    
    return    

# select with subselect
sql_text = "SELECT COLNO, TABNAME, TABSCHEMA, COLNAME, TYPENAME, LENGTH, SCALE FROM SYSCAT.COLUMNS WHERE TABNAME IN (SELECT TABNAME FROM SYSCAT.TABLES WHERE TYPE = 'T') with ur";

USER = getpass.getuser()
PASSWORD = getpass.getpass()
# Need to replace this with FDW data when available
conn = jaydebeapi.connect('com.ibm.db2.jcc.DB2Driver',
                         ['jdbc:db2://hostname:60100/dbname', USER, PASSWORD],
                          '/opt/IBM/db2/V10.1/java/db2jcc4.jar')
curs = conn.cursor()
curs.execute(sql_text)
outData = curs.fetchall()
desc = DataFrame(curs.description)
curs.close()
conn.close()
ind = np.array(desc[0])
ind

curPath = os.getcwd()
outFile = curPath + "/tabCol.csv"

WriteListToCSV(outFile,ind,outData)
