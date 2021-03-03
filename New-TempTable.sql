/* It creates a temporary table with the results of other SELECT */

-- Total n.1
DECLARE @Total1 NVARCHAR(100)
SET @Total1 = (
SELECT COUNT(*) AS [Total1] FROM Table1
)

-- Total n.2
DECLARE @Total2 NVARCHAR(100)
SET @Total2 = (
SELECT COUNT(*) AS [Total2] FROM Table2
)

-- Summary table
DECLARE @Totals TABLE (TableNumber NVARCHAR(100), Total INT)
INSERT INTO @Totals VALUES
	('Table1',@Total1),
	('Table2',@Total2)
SELECT * FROM @Totals
