-- convert string into timestamp
SELECT CAST(regexp_replace('20141014123456789', 
                           '(\\d{4})(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{2})(\\d{3})',
                           '$1-$2-$3 $4:$5:$6.$7') as timestamp) 
