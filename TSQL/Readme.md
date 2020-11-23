# TSQL Admin tools

* `Get-Column` searches all columns containing a specific string in the name, stating also the belonging tables
* `Get-ColumnDataType` returns the data type of a specific column
* `Get-SqlErrorLogPath` returns the SQL error log path and name for the current instance
* `Get-SqlFilePaths` returns all the physical and logical paths for all the files included in the current instance
* `Get-SqlUsersRoles` return the server roles of all the users in the current instance
* `Get-TableName` searches all tables containing a specific string in the name
* `Get-TablesProperties` returns all the general properties of the tables in a specific database
* `New-SqlSysadminUser` creates a new sysadmin login in a specific database
* `Search-SqlString` search a specific text within a specific database, returing the column name and value
* `Search-SqlStringStoredProcedure` creates a stored procedure to search a specific text in a specific database
* `Set-SqlMixedAuthentication` enables the Mixed Authentication on the current instance
* `Stop-SqlConnections` set the database in single user mode, killing all connections
