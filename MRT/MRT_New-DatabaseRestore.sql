/* MRT_New-DatabaseRestore.sql
/*
/* It performs a database restore.
/* The restore source is in @FULLPATH.
/* The restore destination is a database called MRT_RESTORED */
/* NOTE: it requires the roles 'sysadmin','db_owner' or 'db_backupoperator'.
/* Source : https://docs.microsoft.com/it-it/sql/t-sql/statements/restore-statements-transact-sql?view=sql-server-ver15 */

USE MRT

-- Variables
DECLARE @FULLPATH NVARCHAR(255)
SET @FULLPATH = 'C:\MPW\MRT*.bak'
DECLARE @RESTOREDDBNAME NVARCHAR(60)
SET @RESTOREDDBNAME = 'MRT_RESTORED'

-- Instructions
RESTORE DATABASE @RESTOREDDBNAME
FROM DISK = @FULLPATH
WITH  FILE = 1, 
NOUNLOAD,  
STATS = 5

GO
