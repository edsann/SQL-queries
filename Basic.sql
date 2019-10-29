/* VERY Quick cheatsheet */

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
  /* Specify the Primary Key */
  CONSTRAINT PK_TableName PRIMARY KEY CLUSTERED (Attribute1) 
)

/* Add a constraint with a specific criterion on an attribute of the table */
ALTER TABLE TableName
ADD CONSTRAINT CK_Attribute1
CHECK (Attribute1 [condition])
-- To remove it:
DROP CONSTRAINT CK_Attribute1

/* Add a Unique Index to check uniqueness */
CREATE UNIQUE INDEX IX_Attribute1
ON TableName(Attribute1)
                   
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


