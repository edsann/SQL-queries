/* Query to compose the output from several fields */
/* Original fields were overwritten with generic ones */

/* Do not print the total amount at the end */
SET NOCOUNT ON; 

SELECT CAST(

  CAST(
    /* Concatenate fields to build the final string */
  
    /* Last two digits of FIELD1 */
    RIGHT(FIELD1,2) +
    
    /* Last six digits of FIELD2 */
    RIGHT(FIELD2,6) + 
    
    /* 10-digits substring from 3rd position of FIELD3 */
    SUBSTRING(FIELD3,3,10) +
    
    /* Add digit */
    '0'+ 
    
    /* Add last field */
    FIELD4 
    
    /* Cast as decimal with 20 digits */
    AS DECIMAL(20,0)

  /* Generic subtraction */
  ) -1 
  
  /* Cast as NVARCHAR with 20 digits */
  AS NVARCHAR(20)
 
)
    
FROM TABLE 

/* Date time condition */
/* My date is format YYYYMMDDHHmmSS: desiderata is to get all records of today */
WHERE DATETIME >= CONVERT(NVARCHAR, CONVERT(date, GETDATE()), 112) + '000000' 
