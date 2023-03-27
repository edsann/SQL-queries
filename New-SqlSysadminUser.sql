/* It creates a new sysadmin login with the specified password */

USE YourDatabaseName
-- Creates new login
CREATE LOGIN YourUsername WITH PASSWORD = 'YourPassword';
GO
-- Assigns the sysadmin server role
EXEC master..sp_addsrvrolemember @loginame = N'YourUsername', @rolename = N'sysadmin'
GO
