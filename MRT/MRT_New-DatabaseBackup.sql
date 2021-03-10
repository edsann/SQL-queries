/* MRT_New-DatabaseBackup.sql
/*
/* It performs a new database backup, named using the @FILENAME variable composed with the @VERSION variable read from table T05COMFLAGS. 
/* Namely, the file is named "[DATABASE_NAME]-[DBVER]_[yyyyMMdd_HHmm].bak"
/* The backup file is saved in @FULLPATH. */
/* NOTE: It requires the roles 'sysadmin','db_owner' or 'db_backupoperator' */
/* Source : https://docs.microsoft.com/it-it/sql/relational-databases/backup-restore/create-a-full-database-backup-sql-server?view=sql-server-ver15

USE MRT

/* Variables */
DECLARE @VERSION NVARCHAR(255); SELECT @VERSION = CONCAT(SUBSTRING(T05VALORE,1,1),SUBSTRING(T05VALORE,3,2)) FROM T05COMFLAGS WHERE T05TIPO = 'DBVER'
DECLARE @FILENAME NVARCHAR(255); SET @FILENAME = DB_NAME() + '-' + @VERSION +'_' + FORMAT(GETDATE(),'yyyyMMdd_hhmm') + '.bak'
DECLARE @FULLPATH NVARCHAR(255); SET @FULLPATH = 'C:\MPW\' + @FILENAME

/* Backup database MRT */
BACKUP DATABASE MRT_NEW
TO DISK = @FULLPATH
   WITH FORMAT,
      MEDIANAME = 'SQLServerBackups',
      NAME = 'Full Backup of MRT';
GO
