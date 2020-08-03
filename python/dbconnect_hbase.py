import happybase

BATCH_SIZE = 1000
HOST = "0.0.0.0"
NAMESPACE = "com.example.com"
TABLE_NAME = "table_name"

def connect_to_hbase():
    '''
        Connect to HBase server using the parameters above
    '''
    try:
        conn = happybase.Connection(host = HOST,
        table_prefix = NAMESPACE,
        table_prefix_separator = ":")

        conn.open()
    except Exception as e:
        raise e
    finally:
        pass


    
    
    table = conn.table(TABLE_NAME)
    batch = table.batch(batch_size = BATCH_SIZE)
    return conn, batch