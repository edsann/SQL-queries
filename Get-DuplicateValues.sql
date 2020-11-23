/* Get-DuplicateValues.sql
/*
/* Find duplicated values in a table */
 
SELECT field1,field2,field3, COUNT(*) -- Filter only the specified fields
FROM table_name
GROUP BY field1,field2,field3			
HAVING COUNT(*) > 1			
