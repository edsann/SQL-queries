/* SQL Server */

-- Returns database Name, Log Size, Row Size, Total Size for current db
SELECT 
      [Database Name] = DB_NAME(database_id)
    , [Log Size (MB)] = CAST(SUM(CASE WHEN type_desc = 'LOG' THEN size END) * 8. / 1024 AS DECIMAL(8,2))
    , [Row Size (MB)] = CAST(SUM(CASE WHEN type_desc = 'ROWS' THEN size END) * 8. / 1024 AS DECIMAL(8,2))
    , [Total Size (MB)] = CAST(SUM(size) * 8. / 1024 AS DECIMAL(8,2))
FROM sys.master_files WITH(NOWAIT)
WHERE database_id = DB_ID() -- for current db 
GROUP BY database_id
                                                                
                                                                

/* MySql */

-- Returns the database sizes in MB
SELECT 
  table_schema AS "Database", 
  ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS "Size (MB)" 
FROM information_schema.TABLES 
GROUP BY table_schema;

-- Returns the table of a specific DATABASE_NAME
SELECT table_name AS "Table",
ROUND(((data_length + index_length) / 1024 / 1024), 2) AS "Size (MB)"
FROM information_schema.TABLES
WHERE table_schema = "database_name"
ORDER BY (data_length + index_length) DESC;
