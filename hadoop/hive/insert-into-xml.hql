DROP TABLE IF EXISTS [dbname].[tablename];
CREATE EXTERNAL TABLE [dbname].[tablename](
    col1 string,
	col2 string,
	col3 string,
	xml_value string
	)
	STORED AS TEXTFILE
	LOCATION "/data/location/";

INSERT INTO [dbname].[tablename]
SELECT 
regexp_extract(xml_value, "<element-name\\sname=\"(.*?)\"(.*)", 1),
regexp_extract(xml_value, "<element-name\\s(.*?)>(.*)<\/element-name>", 2),
regexp_extract(xml_value, "<element-name\\s(.*?)>(.*)</element-name>", 2),
regexp_replace(regexp_replace(xml_value, "<\\?xml version=\"1.0\" encoding=\"UTF-8\" \\?><element-name(.*?)>", ""), "<\/element-name>", "")
FROM [dbname].xml_raw; 
