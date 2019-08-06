/* Cercare una tabella nel database filtrando per descrizione */ 

USE Mrt						/* Database */
SELECT * FROM information_schema.tables		/* Tabelle presenti nello schema di database */
WHERE Table_name LIKE '%%'			/* Filtro sul nome tabella */
