/* Selecting the total amount of records related to a specific period in terms of YYYYMMdd */
/* Having a table with "EVENTID;DATETIME(YYYYMMDDHHmmss)", the required output is something like : */
/* "CURRENTDAY(YYYYMMdd);TOTAL_EVENTS" */

USE DATABASE_NAME

/* Group the groupings */
SELECT
	G.YYYYMMdd AS CurrentDay,
	SUM(G.Total) AS TotalEvents
FROM (

	/* Group events by day */
	SELECT 
		COUNT(ID) AS Total,
		LEFT(DATETIME,8) AS YYYYMMdd -- Day
	FROM TABLE_NAME 
	WHERE DATETIME BETWEEN '20200101000000' AND '20210611235959' -- Time period
  AND ... -- Other filters on the events
	GROUP BY DATETIME
  
) AS G
GROUP BY G.YYYYMMdd
ORDER BY CurrentDay
