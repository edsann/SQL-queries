/* Search a table in the database by name */ 

USE <Database_name>						/* Database */
SELECT * FROM information_schema.tables		/* Tables in the database schema */
WHERE Table_name LIKE '%%'			/* Filter on the table name */
