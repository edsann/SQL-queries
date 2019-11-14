/* Extracting the univocal attendances, by computing the transits on a specific entrance @VARCO, setting a specific time period between @DATAORAINIZIO and @DATAORAFINE */
/* It gives back the amount of employees, contractors or guests attending within the specified period */
/* It returns a table with the following format: */
/* Employees;Amount_of_employees */
/* Contractors;Amount_of_contractors */
/* Guests;Amount_of_guests */
USE MRT

/* Variables */
DECLARE @VARCO nvarchar(8)
DECLARE @DATAORAINIZIO nvarchar(14)
DECLARE @DATAORAFINE nvarchar(14)

/* Parameters */
SET @VARCO='00000119'
SET @DATAORAINIZIO='20190913000000'
SET @DATAORAFINE='20190914000000'

/* Counting Tipomatricola */
SELECT CASE TIPOMATRICOLA
	WHEN '0' THEN 'DIPENDENTI'
	WHEN '1' THEN 'ESTERNI'
	WHEN '2' THEN 'VISITATORI'
END, COUNT(*)
FROM 
(
	(
	/* Select Attendances of a specific day */
	SELECT 
		T37DATAORA AS DATAORA,
		T37MATRICOLA AS ID, 
		T37TIPOMATRICOLA AS TIPOMATRICOLA, 
		T37CODAZIENDAINTERNA AS AZIENDA
	FROM    
		(
		/* Select and enumerate Transits by DataOra*/
		SELECT T37ID, T37DATAORA, T37MATRICOLA, T37TIPOMATRICOLA, T37CODAZIENDAINTERNA,
	    ROW_NUMBER() OVER 
			(PARTITION BY T37MATRICOLA ORDER BY T37DATAORA) AS ROWNUMBER
	    FROM T37ACCTRANSITI

	/* Filters */
	WHERE T37DATAORA BETWEEN @DATAORAINIZIO AND @DATAORAFINE
	AND T37ENTRAESCE='1'
	AND T37VARCO=@VARCO
	AND T37MATRICOLA<>'?') 
	AS TRANSITS

	/* Pick the first result of each enumeration*/							
	WHERE TRANSITS.ROWNUMBER = 1)
) AS ATTENDANCES_OF_DAY

/* Grouping attendances by TipoMatricola */
GROUP BY ATTENDANCES_OF_DAY.TIPOMATRICOLA
HAVING COUNT(*)>=0
