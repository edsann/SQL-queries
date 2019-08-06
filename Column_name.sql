/* Search all columns containing a specific string, stating also the belonging tables */

USE 
  DatabaseName									/* Database */
SELECT 
  Columns.name AS ColumnName,		/* Column name */
	Tables.name AS TableName			/* Belonging table name */
FROM
	sys.columns Columns						/* Column in the database schema */
JOIN
	sys.tables Tables ON Columns.object_id = Tables.object_id	/* Correspondence column-table */
WHERE
	Columns.name LIKE '%%'				/* Filter on the column name */
