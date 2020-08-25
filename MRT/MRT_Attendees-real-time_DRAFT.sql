/* Simil- Presenti in azienda immediato */
/* ( DA PERFEZIONARE! - E soprattutto ricavata da un'altra query che faceva tutt'altro ) */
/* Essenzialmente ricostruisce i transiti in un certo range di data-ora e in un certo range di varchi,
raggruppa le righe per matricola e azienda interna e riporta solo la prima riga (ovvero, il primo ingresso della giornata) */

SELECT DATAORA, MATRICOLA, COGNOME, NOME, 
	CASE TIPOMATRICOLA 
		WHEN '0' THEN 'DIPENDENTE'
		WHEN '1' THEN 'COLLABORATORE ESTERNO'
		WHEN '2' THEN 'VISITATORE'
		END AS TIPO
FROM 
(
	(
	/* Select Attendances of a specific day */
	SELECT T37DATAORA AS DATAORA, T37MATRICOLA AS MATRICOLA, T37COGNOME AS COGNOME, T37NOME AS NOME, T37TIPOMATRICOLA AS TIPOMATRICOLA, T37CODAZIENDAINTERNA AS AZIENDA
	FROM    
		(
		/* Select and enumerate Transits by DataOra*/
		SELECT T37ID, T37DATAORA, T37MATRICOLA, T37COGNOME, T37NOME, T37TIPOMATRICOLA, T37CODAZIENDAINTERNA,
	    ROW_NUMBER() OVER 
			(PARTITION BY T37MATRICOLA ORDER BY T37DATAORA) AS ROWNUMBER
	    FROM T37ACCTRANSITI
	WHERE T37DATAORA BETWEEN '20200817000000' AND '20200817093500' -- Insert here the dates
	AND T37ENTRAESCE='1'
	AND T37VARCO IN (SELECT T23CODICE FROM T23ACCVARCHI WHERE T23VARCOPERIFERICO='1' AND T23IMPIANTO='0021')  -- Insert here the gates
	AND T37MATRICOLA<>'?') 
	AS TRANSITS

	/* Pick the first result of each enumeration*/							
	WHERE TRANSITS.ROWNUMBER = 1)
) AS ATTENDANCES_OF_DAY
