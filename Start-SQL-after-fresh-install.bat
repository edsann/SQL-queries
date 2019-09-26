:: Fresh installation of SQL 2014, starting service gives error %%945
:: https://www.gerjon.com/microsoft/error-starting-sql-instance-after-fresh-install/

:: Start service in single user mode and connect
NET START MSSQL$SQLEXPRESS /f /T3608
SQLCMD -S .\SQLEXPRESS

:: Name, physical name and state of the master files of all databases
SELECT name, physical_name, state_desc 
FROM sys.master_files 
ORDER BY database_id;
GO

:: Notice in the output that some databases may be configured on non-existing drives for unknown reasons

:: Set the correct drives/path settings
:: Be aware that the model database needs to be set first! Otherwise, the other databases won’t be changed and you’ll get lots of errors!
ALTER DATABASE model MODIFY FILE (NAME = modeldev, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\model.mdf'); go
ALTER DATABASE model MODIFY FILE (NAME = modellog, FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\modellog.ldf'); go
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdev, FILENAME = ‘C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\tempdb.mdf’);
ALTER DATABASE tempdb MODIFY FILE ( NAME = templog, FILENAME = ‘C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\templog.ldf’);
ALTER DATABASE msdb MODIFY FILE ( NAME = MSDBData, FILENAME = ‘C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MSDBData.mdf’);
ALTER DATABASE msdb MODIFY FILE ( NAME = MSDBLog, FILENAME = ‘C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MSDBLog.ldf’);
GO
exit

:: Connect via SSMS
:: If you get the 'login failed for user sa' error, try the next:
NET STOP MSSQL$SQLEXPRESS
NET START MSSQL$SQLEXPRESS /m
:: Connect to the master database in single-user mode
SQLCMD -S .\SQLEXPRESS
:: Create a new user
CREATE LOGIN noob WITH PASSWORD='whatever'
GO
sp_addsrvrolemember 'security','sysadmin'
GO
quit

:: Restart SQL Service in normal mode
NET STOP MSSQL$SQLEXPRESS
NET START MSSQL$SQLEXPRESS
