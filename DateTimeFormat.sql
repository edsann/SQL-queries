/* Select date and time in a specific format */

SELECT format(getdate(),'yyyyMMddHHmmssffff')

-- Syntax:
-- FORMAT ( value, format [, culture ] ) 
-- -- Example:
-- -- DECLARE @d DATETIME = GETDATE();  
-- -- SELECT FORMAT( @d, 'dd/MM/yyyy', 'en-US' ) AS 'DateTime Result'  
-- -- ,FORMAT(123456789,'###-##-####') AS 'Custom Number Result';  
