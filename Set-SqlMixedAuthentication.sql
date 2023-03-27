/* The script activates the Mixed Mode Authentication in the current SQL Server instance */

USE [master]
GO
/* [Note: 2 indicates mixed mode authentication. 1 is for windows only authentication] */
EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE', 
     N'Software\Microsoft\MSSQLServer\MSSQLServer',
     N'LoginMode', REG_DWORD, 2
GO

/* Restart SQL Server engine */


