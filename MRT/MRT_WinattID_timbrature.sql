/* Recupero timbrature in formato WinattID */
/* Da lanciare DOPO aver corretto l'associazione ID-IDX con MicronImport, in quanto effettua una JOIN sulla T25COMBADGE */

/*
Tracciato export presenze WINATTID:
Campo:				Lunghezza:	Note:
Codice del varco	3nn			Ultimi tre caratteri codice varco
ID/IDX Badge		10nn/an		Identificativo badge (ID 10nn) oppure codice di traccia (IDx 10an)
Flag Entra/Esce		1nn			(‘0’=Entra, ‘1’=Esce), dalla versione 5.1.6 è possibile parametrare il carattere utilizzato per identificare i movimenti di entrata e di uscita
Causale				4nn			Codice causale (0000=Nessuna causale)
Data/ora			10nn		Formato GGMMAAHHMM
CRLF				--			CRLF
*/

-- Variabile: data ora di inizio del periodo
DECLARE @DATAORAINIZIO NVARCHAR(14)
SET @DATAORAINIZIO = '20000310000000'

SELECT CONCAT(
	RIGHT(T.T37VARCO,3),		-- Ultimi tre caratteri codice varco
	B.T25CODICE,				-- ID Badge (v.INNER JOIN)
	CASE T.T37ENTRAESCE			-- Direzione
		WHEN '1' THEN (SELECT T103VALUE FROM T103COMPARAMS WHERE T103PROGRAM='MICRONSERVICE' AND T103PARAM='WinAttEntra')
		WHEN '2' THEN (SELECT T103VALUE FROM T103COMPARAMS WHERE T103PROGRAM='MICRONSERVICE' AND T103PARAM='WinAttEsce')
		END,						
	CASE T.T37CAUSALE			-- Causale
		WHEN '' THEN '0000'
		ELSE T.T37CAUSALE
		END,
	SUBSTRING(T.T37DATAORA,7,2),	-- Data ora (GG)
	SUBSTRING(T.T37DATAORA,5,2),	-- Data ora (MM)
	SUBSTRING(T.T37DATAORA,3,2),	-- Data ora (YY)
	SUBSTRING(T.T37DATAORA,9,2),	-- Data ora (HH)
	SUBSTRING(T.T37DATAORA,11,2)	-- Data ora (mm)
	)
FROM T37ACCTRANSITI AS T
INNER JOIN T25COMBADGE AS B
	ON T.T37IDX = B.T25ID1
WHERE T37DATAORA >= @DATAORAINIZIO 
	AND T37MATRICOLA='?'		-- Matricole sconosciute
	AND T37TIPORECORD='P'		-- Timbrature di presenze
ORDER BY T37DATAORA ASC
