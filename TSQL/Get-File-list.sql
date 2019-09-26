/* Returns a list of all the logical and physical names for the files for every single database on the SQL Server Instance */
/*https://blog.sqlauthority.com/2018/11/19/sql-server-get-list-of-the-logical-and-physical-name-of-the-files-in-the-entire-database/ */

SELECT 
  d.name DatabaseName, 
  f.name LogicalName,
  f.physical_name AS PhysicalName,
  f.type_desc TypeofFile
FROM sys.master_files f
INNER JOIN sys.databases d ON d.database_id = f.database_id
GO
