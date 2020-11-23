/* Select-ExcludeNumbers.sql
/*
/* Filters only NON-NUMERICAL results in MyColumn */

USE DatabaseName
SELECT * FROM MyTable
WHERE MyColumn LIKE '%[^0-9]%'
