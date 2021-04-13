/* Selezione degli utenti e dei rispettivi gruppi di utenti */
/* Nel caso in cui sia attiva la selezione del gruppo di utenti in fase di login,
vengono mostrati tutti i gruppi di utenti selezionabili così come specificato
in organigramma */
SELECT
	T21Enabled AS Attivo, 
	T21UTENTE AS Username, 
	T21CodAziendaInterna AS [Codice Azienda Dipendente], 
	T71DescrAzienda AS [Descrizione Azienda Dipendente], 
	t21DIPENDENTE AS [Matricola Dipendente], 
	T26COGNOME AS Cognome, 
    T26NOME AS Nome, 
    CASE T21CANSELECTGROUP WHEN '0' THEN 'No' WHEN '1' THEN 'Sì' END AS [Può cambiare gruppo],
    Duplicati.T36CONTROLLATO AS [Gruppo/i utenti], 
	SUBSTRING(T21LastLogin, 1, 4) + '-' + SUBSTRING(T21LastLogin, 5, 2) + '-' + SUBSTRING(T21LastLogin, 7, 2) AS [Ultimo login]
FROM T21COMUTENTI 
LEFT OUTER JOIN T26COMDIPENDENTI ON T21DIPENDENTE = T26CODICE AND T21CodAziendaInterna = T26CodAzienda -- Dipendenti
LEFT OUTER JOIN T71ComAziendeInterne ON T21CodAziendaInterna = T71Codice -- Aziende interne
LEFT OUTER JOIN (
	select 
        O.T36CODICE AS Utente
		,GruppiDiUtenti = Stuff(
            -- Tabella utente / gruppi di utenti selezionabili da organigramma
            (Select Distinct ', ' +T36CONTROLLATO From T36COMORGANIGRAMMA 
            Where T36CODICE=O.T36CODICE
		    AND T36FLAGCONTROLLA='U' AND T36FLAGGRUPPO='0'
		   For XML Path ('')),1,2,'') 
	From T36COMORGANIGRAMMA O
	Group By T36CODICE) AS Duplicati ON T21COMUTENTI.T21UTENTE=DUPLICATI.Utente
