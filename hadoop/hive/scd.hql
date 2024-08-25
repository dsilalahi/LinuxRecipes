/*
table employee
---------------
Jerry	1500
George	1400
Elaine	1300
Kramer	1250
Babu	1800
Newman	750
Frank	560
Estelle	800
Morty	980
Helen	1050
*/


// SCD-1 implementation
SELECT 
	CASE WHEN cdc_status='update' THEN tbl_updates_final
		WHEN cdc_status='nochange' THEN tbl_original_final
		WHEN cdc_status='new' THEN tbl_updates_final
		WHEN cdc_status='delete' THEN tbl_original_final
	END
FROM
	(SELECT 
		CASE WHEN tbl_original.col1 = tbl_updates.col1 AND tbl_original.col2 = tbl_updates.col2 THEN 'nochange'
			WHEN tbl_original.col1 = tbl_updates.col1 AND tbl_original.col1 <> tbl_updates.col2 THEN 'update'
			WHEN tbl_original.col1 IS NULL THEN 'new'
			WHEN tbl_updates.col1 IS NULLL THEN 'delete'
			END as cdc_status,
		CONCAT(tbl_original.col1, ', ', tbl_original.col2) as tbl_original_final,
		CONCAT(tbl_updates.col1, ',', tbl_updates.col2) as tbl_updates_final
		FROM tbl_original
			FULL OUTER JOIN tbl_updates ON tbl_original.col1 = tbl_updates.col1) as b1;
