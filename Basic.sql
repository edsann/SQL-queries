/* VERY Quick cheatsheet */

/* 1. DDL i.e. Data Definition Language */

/* Create new database with name DatabaseName according to the model's database properties */
CREATE DatabaseName;

/* Select active database */
USE DatabaseName; 

/* Create a new table with name TableName and the following content */
CREATE TABLE TableName( 
  Attribute1 type1 IDENTITY(1000,1) NOT NULL   --Attribute of type1 (int, char-varchar-nvarchar(length), money, date, etc.); Identity is a value that increases automatically, starting from 1000 and increasing by 1; no NULL values are allowed
  Attribute2 type2 NULL
)

/* Erase the content of the table, though keeping the columns intact */
TRUNCATE TABLE TableName

/* Remove a column from the table */
DROP Attribute2

/* Remove the whole table */
DROP TABLE TableName

/* 2. DML i.e. Data Manipulation Language */


