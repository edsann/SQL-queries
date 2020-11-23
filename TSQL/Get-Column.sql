/* Get-Column.sql
/*
/* Search all columns containing a specific string in the description, stating also the belonging tables */

USE
	DATABASENAME --Insert your database name
SELECT 
	Columns.name AS ColumnName --Column name
	Tables.name AS TableName --Table name
FROM
	sys.columns Columns --Columns in the database schema
JOIN
	sys.tables Tables ON Columns.object_id = Tables.object_id --Correspondence column-name
WHERE
	Columns.name LIKE '%%' --Filter on the column name, insert here the searching string
