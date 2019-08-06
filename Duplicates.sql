/* Find duplicated values in a table */
 
SELECT field1,field2,field3, COUNT(*)		/*Filter only the specified fields*/
FROM table_name					        /*Source table*/
GROUP BY field1,field2,field3			/*Grouping the specified fields*/
HAVING COUNT(*) > 1				/*Count greater than 1*/
