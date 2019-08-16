/* Find duplicated values in a table */
 
SELECT 
  /* Filter only the specified fields */
  field1,field2,field3, COUNT(*)
FROM 
  /* Source table */
  table_name
GROUP BY 
  /* Grouping the specified fields */
  field1,field2,field3			

/*Count greater than 1*/
HAVING COUNT(*) > 1			
