/* Just an example of an 'advanced' SQL query */

DECLARE @date DATETIME
SELECT @date = '10/31/09'

SELECT
      t1.EmpName,
      t1.Region,
      t1.TourStartDate,
      t1.TourEndDate,
      t1.FOrdDate,
      FOrdType  = MAX(CASE WHEN o.OrderDate = t1.FOrdDate THEN o.OrderType  ELSE NULL END),
      FOrdTotal = MAX(CASE WHEN o.OrderDate = t1.FOrdDate THEN o.OrderTotal ELSE NULL END),
      t1.LOrdDate,
      LOrdType  = MAX(CASE WHEN o.OrderDate = t1.LOrdDate THEN o.OrderType  ELSE NULL END),
      LOrdTotal = MAX(CASE WHEN o.OrderDate = t1.LOrdDate THEN o.OrderTotal ELSE NULL END)
  FROM 
      (--Derived table t1 returns the tourdates, and the order dates
      SELECT
            e.EmpId,
            e.EmpName,
            et.Region,
            et.TourStartDate,
            et.TourEndDate,
            FOrdDate = MIN(o.OrderDate),
            LOrdDate = MAX(o.OrderDate)
        FROM #Employees e INNER JOIN #EmpTours et
          ON e.EmpId = et.EmpId INNER JOIN #Orders o
          ON e.EmpId = o.EmpId
       WHERE et.TourStartDate <= @date
         AND (et.TourEndDate > = @date OR et.TourEndDate IS NULL)
         AND o.OrderDate BETWEEN et.TourStartDate AND @date
       GROUP BY e.EmpId,e.EmpName,et.Region,et.TourStartDate,et.TourEndDate
      ) t1 INNER JOIN #Orders o
    ON t1.EmpId = o.EmpId
   AND (t1.FOrdDate = o.OrderDate OR t1.LOrdDate = o.OrderDate)
 GROUP BY t1.EmpName,t1.Region,t1.TourStartDate,t1.TourEndDate,t1.FOrdDate,t1.LOrdDate
