/* Path of the Error Log */
/* https://blog.sqlauthority.com/2015/03/24/sql-server-where-is-errorlog-various-ways-to-find-its-location/ */

/* Query */

USE MASTER
GO
EXEC xp_readerrorlog 0, 1, N'Logging SQL Server messages in file'
GO

/* If connection to SQL is not available */
/* - SQL Server Configuration Manager > SQL Server Services > SQL Server (INSTANCENAME) [Properties] > Startup Parameters > -e(...) */
/* or */
/* Regedit > Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\(version)\MSSQLServer\Parameters */
