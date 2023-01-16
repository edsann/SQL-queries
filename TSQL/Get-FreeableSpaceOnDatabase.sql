/*
 * https://dba.stackexchange.com/questions/77489/truncated-200gb-table-but-disk-space-not-released
 * For a specific database, it returns the total size in MB, the used space in MB and hence the used space percentage
*/

use [YOUR_DATABASE_NAME];
go

;with db_file_cte as
(
    select
        name,
        type_desc,
        physical_name,
        size_mb = 
            convert(decimal(11, 2), size * 8.0 / 1024),
        space_used_mb = 
            convert(decimal(11, 2), fileproperty(name, 'spaceused') * 8.0 / 1024)
    from sys.database_files
)
select
    name,
    type_desc,
    physical_name,
    size_mb,
    space_used_mb,
    space_used_percent = 
        case size_mb
            when 0 then 0
            else convert(decimal(5, 2), space_used_mb / size_mb * 100)
        end
from db_file_cte;
