/* Joinbetween two DBs with different collations */
/* No need to specify USE DATABASE_NAME at the beginning because the DBs are specified within the query */
/* Replace DATABASE*, TABLE*, COLLATE*, FIELD* with your values */

SELECT 
	* 
FROM
	/* Table1 from Database1 */
	[Database1].[dbo].[Table1] AS T1
JOIN 
	/* Table2 from Database2 */
	[Database2].[dbo].[Table2] AS T2
ON 
	/* Keys to use, each one with its own collation */
		/* E.g. Collate1 = Latin1_General_CI_AS */
		/* E.g. Collate2 = SQL_Latin1_General_CP850_CI_AI */
	T1.Field1 COLLATE Collate1 = T2.Field2 COLLATE Collate2
WHERE 
	/* Condition */
	Whatever

/* An alternative below: */

/*
select sone_field collate SQL_Latin1_General_CP850_CI_AI
  from table_1
    inner join table_2
      on (table_1.field collate SQL_Latin1_General_CP850_CI_AI = table_2.field)
  where whatever
*/
