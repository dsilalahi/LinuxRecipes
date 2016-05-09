First, find what MySql database the metastore is stored in. This is going to be in your hive-site.conf - connection URL. Then, once you connect to MySql you can

```sql
COLUMNS
DBS  -- the list of schemas
PARTITIONS
TBLS - tables

select distinct a.tbl_id,a.tbl_name
    from TBLS a
        join PARTITIONS c on (a.TBL_ID=c.TBL_ID)
        join SDS b on (c.SD_ID=b.SD_ID)
 where b.location like '%sbx.db%' and a.DB_ID=1;
```

```sql
use metastore; 
show tables; 
select * from TBLS; <-- this will give you list of your hive tables
```

```sql
SELECT c.column_name, tbl_name, c.comment, c.type_name, c.integer_idx,
 tbl_id, create_time, owner, retention, t.sd_id, tbl_type, input_format, is_compressed, location,
 num_buckets, output_format, serde_id, s.cd_id
FROM TBLS t, SDS s, COLUMNS_V2 c
-- WHERE tbl_name = 'my_table'
WHERE t.SD_ID = s.SD_ID
AND s.cd_id = c.cd_id
AND c.column_name = 'my_col'
order by create_time
```

```java
public String getLocationForTable(String db, String table) {
    HiveConf hiveConf = new HiveConf(SessionState.class);
    HiveMetaStoreClient client = null;
    try {
        client = new HiveMetaStoreClient(hiveConf);
    } catch (MetaException e) {
        throw new RuntimeException("getting location for " + db + " "
                                   + table, e);
    }
    org.apache.hadoop.hive.metastore.api.Table t = null;
    try {
        t = client.getTable(db, table);
    } catch (MetaException e) {
        throw new RuntimeException("getting location for " + db + " "
                                   + table, e);
    } catch (TException e) {
        throw new RuntimeException("getting location for " + db + " "
                                   + table, e);
    } catch (NoSuchObjectException e) {
        throw new RuntimeException("getting location for " + db + " "
                                   + table, e);
    }
    StorageDescriptor sd = t.getSd();

    return anonymizeHostname(sd.getLocation());
}
```

```java
public static void assertTableIsExternal(
    HiveMetaStoreClient client, String db, String name)
    throws MetaException, TException {
  final Table table = client.getTable(db, name);
  Assert.assertTrue("Table should be external db:" + db + " table:" + table,
      MetaStoreUtils.isExternalTable(table) &&
      TableType.EXTERNAL_TABLE.toString().equals(table.getTableType()));
}
```

http://www.programcreek.com/java-api-examples/index.php?api=org.apache.hadoop.hive.metastore.HiveMetaStoreClient

