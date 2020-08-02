import happybase

batch_size = 1000
host = "0.0.0.0"
file_path = ""
namespace = "com.example.com"
row_count = 0
table_name = "table_name"

def connect_to_hbase():
    '''
        Connect to HBase server using the parameters above
    '''
    try:
        conn = happybase.Connection(host = host,
        table_prefix = namespace,
        table_prefix_separator = ":")
    except Exception as e:
        raise e
    finally:
        pass


    
    conn.open()
    table = conn.table(table_name)
    batch = table.batch(batch_size = batch_size)
    return conn, batch