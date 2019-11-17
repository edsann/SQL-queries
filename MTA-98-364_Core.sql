/* VERY Quick cheatsheet */

/* Shortcuts */
-- ctrl + shift + r = refresh the IntelliSense cache
-- Alt + q + s = parameter menu for stored procedures (SSMS >= 2012)

/* 1. DDL i.e. Data Definition Language */

/* Create new database with name DatabaseName according to the model's database properties */
CREATE DatabaseName;
GO

/* Select active database */
USE DatabaseName; 

/* Create a new table with name TableName and the following content */
CREATE TABLE TableName( 
  Attribute1 type1 IDENTITY(1000,1) NOT NULL,   --Attribute of type1 (int, char-varchar-nvarchar(length), money, date, etc.); Identity is a value that increases automatically, starting from 1000 and increasing by 1; no NULL values are allowed
  Attribute2 type2 NULL,
/* Specify the Primary Key/Keys */
CONSTRAINT PK_TableName PRIMARY KEY CLUSTERED (Attribute1, Attribute2)
/* Specify the Foreign Key/Keys */
/* Foreign keys are created on the child tables, where the same field appears many times */
/* The Parent tables are supposed to contain the key field only once, being the primary key there */
CONSTRAINT FK_TableName_ParentTableName FOREIGN KEY (Attribute2)
	REFERENCES ParentTableName(Attribute2) -- Reference to the field in the Parent Table 
	/* Referential Integrity, i.e. propagation properties */
	ON DELETE CASCADE -- Activate the 'cascade' option for Deleting the key on the Parent Table: 
		-- any deletion in the parent table will delete any related record on the child table (other options: no action, set null)
	ON UPDATE CASCADE -- Activate the 'cascade' option for Updating the key on the Parent Table
		-- any update in the parent table will update any related record on the child table (other options: no action, set null) 
)

/* Add a constraint with a specific criterion on an attribute of the table */
ALTER TABLE TableName
ADD CONSTRAINT CK_Attribute1
CHECK (Attribute1 [condition])
-- To remove it:
DROP CONSTRAINT CK_Attribute1

		   
		   
/* Add a Clustered Index on a new table (every table can have at most one clustered index: it's the main sorting index of the table) */
/* If the table has a Primary Key constraint, the PK itself is the clustered index of the table */
/* The UNIQUE options sets the uniqueness of the field: repeated values will not be allowed */
CREATE UNIQUE CLUSTERED INDEX IX_TableName_Attribute1 ON TableName(Attribute1)
/* Add a Non-Clustered Index on an existing table (non-clustered indexes are additional indexes, basically setting additional sorting orders to the clustered index of the table) */
CREATE NONCLUSTERED INDEX IX_TableName_Attribute2 ON TableName(Attribute2)
/* Delete an index */
DROP INDEX IX_TableName_IndexName ON TableName

		   
		   
/* Erase the content of the table, though keeping the columns intact */
TRUNCATE TABLE TableName

/* Remove a column from the table */
DROP Attribute2


/* Remove the whole table */
DROP TABLE TableName

/* 2. DML i.e. Data Manipulation Language */

/* Insert values */
INSERT INTO TableName (Attribute1, Attribute2) 
VALUES (Value1_1, Value1_2), 
        (Value2_1, Value2_2),
        (Value3_1, Value3_2)

/* Aggregate functions: COUNT, AVG, MIN, MAX */

-- Group records in TableName by a specific value
SELECT ValueToBeGrouped FROM TableName
GROUP BY (ValueToBeGrouped)

-- Gives the amount of record with a grouped value
SELECT 
  ValueToBeGrouped,
   COUNT(ValueToBeCounted) AS NumberOfRecords
FROM TableName
GROUP BY (ValueToBeGrouped)
                   
-- Gives the average
SELECT AVG(ValueToAverage)
FROM TableName

/* 3. Views, Stored Procedures, Functions */
                   
-- Create a new view                   
CREATE VIEW ViewName AS
SELECT ...

-- Create a stored procedure with parameters
CREATE PROCEDURE ProcedureName
	-- Define the parameter and its default value
	@Variable DataType(length) = DEFAULTVALUE
AS
BEGIN
	SELECT Value FROM TableName
	WHERE Value = @Variable
END
GO

-- Run your stored procedure
EXEC ProcedureName @Variable=VALUE

-- Create Function
CREATE FUNCTION FunctionName
(
    -- Add the parameters for the function here
    @Variable1 DataType1,
    @Variable2 DataType2
)
RETURNS DataTypeResult
AS
BEGIN
    -- Declare the return variable here
    DECLARE @Result DataTypeResult

    -- Add the T-SQL statements to compute the return value here
    SELECT @Result = [EXPRESSION WITH @Variable1 and @Variable2]

    -- Return the result of the function
    RETURN @Result

END
GO

-- Calling the function
SELECT ..., dbo.FunctionName(@Variable1,@Variable2) AS Result

-- Built-in functions
SCOPE_IDENTITY() -- It returns the last Identity value corresponding to the specified column
GETDATE() -- It returns today's date-time
		   
/* In order to rollback from critic operations, like TRUNCATE or DELETE or massive UPDATEs */
-- Begin transaction
BEGIN TRAN
	[QUERY]
COMMIT -- To finalize the query (this command ends the transaction), or
ROLLBACK -- To undo the query (this command ends the transaction)
