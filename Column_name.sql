/* Search all columns containing a specific string, stating also the belonging tables */

USE
	/* Insert your database name */
	DATABASENAME									
SELECT 
	/* Column Name */
	Columns.name AS ColumnName,
	/* Belonging table name */
	Tables.name AS TableName
FROM
	/* Column in the database schema */
	sys.columns Columns
JOIN
	/* Correspondence column-table */
	sys.tables Tables ON Columns.object_id = Tables.object_id
WHERE
	/* Filter on the column name, insert here the searching string */
	Columns.name LIKE '%%'
