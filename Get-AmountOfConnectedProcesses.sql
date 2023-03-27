-- Quantità di processi connessi all'istanza

SELECT hostname, COUNT(hostname) AS Processes
FROM sys.sysprocesses AS P
JOIN sys.sysdatabases AS D ON (D.dbid = P.dbid)
JOIN sys.sysusers AS U ON (P.uid = U.uid)
GROUP BY hostname
ORDER BY COUNT(hostname) DESC
