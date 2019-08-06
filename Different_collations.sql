/* Joinbetween two DBs with different collations */
/* No need to specify USE DATABASE_NAME at the beginning because the DBs are specified within the query */

	SELECT * FROM [Database1].[dbo].[Table1] AS T1						/* Table1 from Database1 */
	JOIN [Database2].[dbo].[Table2] AS T2							/* Table2 from Database2 */
	ON T1.FIELD1 COLLATE Latin1_General_CI_AS = T2.FIELD2 COLLATE Latin1_General_CI_AS 	/* Keys to use, each one with its own collation */
	WHERE [Condition]	
