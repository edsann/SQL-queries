/* Get-TableName.sql
/*
/* It Searches a table in the database by table name */ 

USE DatabaseName -- Insert database name
SELECT * FROM information_schema.tables -- Tables in the database schema
WHERE Table_name LIKE '%%' -- Filter on the table name			
