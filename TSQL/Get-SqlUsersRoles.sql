/* Get-SqlUsersRoles.sql
/*
/* It lists all SQL server users, specifying the corresponding roles */

SELECT
    spU.name
    ,MAX(CASE WHEN srm.role_principal_id = 3 THEN 1 END) AS sysadmin
    ,MAX(CASE WHEN srm.role_principal_id = 4 THEN 1 END) AS securityadmin
    ,MAX(CASE WHEN srm.role_principal_id = 5 THEN 1 END) AS serveradmin
    ,MAX(CASE WHEN srm.role_principal_id = 6 THEN 1 END) AS setupadmin
    ,MAX(CASE WHEN srm.role_principal_id = 7 THEN 1 END) AS processadmin
    ,MAX(CASE WHEN srm.role_principal_id = 8 THEN 1 END) AS diskadmin
    ,MAX(CASE WHEN srm.role_principal_id = 9 THEN 1 END) AS dbcreator
    ,MAX(CASE WHEN srm.role_principal_id = 10 THEN 1 END) AS bulkadmin
FROM
    sys.server_principals AS spR
JOIN
    sys.server_role_members AS srm
ON
    spR.principal_id = srm.role_principal_id
JOIN
    sys.server_principals AS spU
ON
    srm.member_principal_id = spU.principal_id
WHERE
    spR.[type] = 'R'
GROUP BY
    spU.name
