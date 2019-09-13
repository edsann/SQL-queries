/* Kill connections and set to single user mode */
    
USE Database_name
GO
ALTER DATABASE Database_name
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE
GO
 
/* 
Do your operations, e.g. restore files or filegroups 
*/
 
/* Set the database back in to multiple user mode */
USE Database_name
GO
ALTER DATABASE Database_name 
SET MULTI_USER
GO
