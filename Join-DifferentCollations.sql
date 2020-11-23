/* Join-DifferentCollations.sql
/*
/* Joinbetween two DBs with different collations */
/* No need to specify USE DATABASE_NAME at the beginning because the DBs are specified within the query */
/* Replace DATABASE*, TABLE*, COLLATE*, FIELD* with your values */

SELECT * 
FROM [Database1].[dbo].[Table1] AS T1 -- Table1 from Database1 
JOIN [Database2].[dbo].[Table2] AS T2 -- Table2 from Database2
ON T1.Field1 COLLATE Collate1 = T2.Field2 COLLATE Collate2 -- Keys to use, each one with its own collation
	/* E.g. Collate1 = Latin1_General_CI_AS */
	/* E.g. Collate2 = SQL_Latin1_General_CP850_CI_AI */
WHERE [CONDITION] -- Insert whatever condition

/* An alternative below: */

/*
select sone_field collate SQL_Latin1_General_CP850_CI_AI
  from table_1
    inner join table_2
      on (table_1.field collate SQL_Latin1_General_CP850_CI_AI = table_2.field)
  where whatever
*/
