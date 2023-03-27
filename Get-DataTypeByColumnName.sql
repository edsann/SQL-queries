/* It returns the data_type of 'yourColumnName' in 'yourTableName' */

SELECT DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE 
     TABLE_NAME = 'yourTableName' AND 
     COLUMN_NAME = 'yourColumnName'
