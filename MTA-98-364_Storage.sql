/* Normalization rules (Normal Forms or NFs) */

/* Initial table */
CREATE TABLE Customers(
  CustomerFullName,
  CustomerAddress,
  HomePhoneNumber,
  CellPhoneNumber,
  OfficePhoneNumber,
  MainCreditCard,
  SecondaryCreditCard
)

/*
+ 1st NORMAL FORM: it ensures records are in an 'entity' format by:
  - Establishing a primary identifier (1NFa)
  - Removing repeating and multivalued attributes (1NFb)
Check the First Normal Form:
Do each table have a single or composite Primary Key?
Do each column contain a single value?
*/

CREATE TABLE Customers(
  CustomerID,           -- Introduced as Primary Key (1NFa)
  /*CustomerFullName*/  -- Split into the following fields (1NFb)
  CustomerFirstName,
  CustomerLastName,
  /*CustomerAddress*/   -- Split into the following fields (1NFb)
  StreetAddress,
  City,
  State,
  ZIP,
  /*HomePhoneNumber,
  CellPhoneNumber,
  OfficePhoneNumber*/   -- Converted into PhoneNumber and PhoneType (1NFb)
  PhoneNumber,
  PhoneType
  /*MainCreditCard*/
  /*SecondaryCreditCard*/   -- Converted into CreditCard and CreditCardType (1NFb)
  CreditCard,
  CreditCardType
)

/*
+ 2nd NORMAL FORM: Eliminate redundant data introduced in applying the 1NF
(the database must be in 1NF)
  - Move redundant data into related tables
* Watch out any related data when working with tables which use multiple attributes to define unique values ("Composite Primary Keys").
*/
CREATE TABLE Customers(
  CustomerID,
  CustomerFirstName,
  CustomerLastName,
  StreetAddress,
  City,
  State,
  ZIP,
  /*PhoneNumber,
  PhoneType*/       -- Moved to the new table CustomerPhone
  /*CreditCard,
  CreditCardType*/  -- Moved to the new table CustomerCreditCard
)
CREATE TABLE CustomerPhone(
  PhoneNumber,        -- Composite Primary Key (1NFa)
  CustomerID          -- Composite Primary Key (1NFa)
  PhoneType
)
CREATE TABLE CustomerCreditCard(
  CreditCardNumber,   -- Composite Primary Key (1NFa)
  CustomerID,         -- Composite Primary Key (1NFa)
  /*CardExpirationDate,
  CreditCardName*/    -- Moved to the new table CreditCardDetails
  PrimaryCreditCard (y/n)
)
CREATE TABLE CreditCardDetails(
  CreditCardNumber,   -- Primary key (1NFa)
  CardExpirationDate,
  CreditCardName,
  BillingAddress,
  BillingCity,
  BillingState,
  BillingZIP
)

/*
+ 3rd NORMAL FORM: Eliminate columns not dependent on key fields (the database must be in 2NF)
  - Remove transitively dependent data that does not depend on key
*/
CREATE TABLE Customers(
  CustomerID,         --PK
  CustomerFirstName,
  CustomerLastName,
  StreetAddress,
  City,
  State,
  ZIP
)
CREATE TABLE CustomerPhone(
  PhoneNumber,        --PK
  CustomerID          --PK
  PhoneType
)
CREATE TABLE CustomerCreditCard(
  CreditCardNumber,   --PK
  CustomerID,         --PK
  PrimaryCreditCard (y/n)
)
CREATE TABLE CreditCardDetails(
  CreditCardNumber,   --PK
  CardExpirationDate,
  CreditCardName,
  BillingAddress,
  BillingCity,
  BillingState,
  BillingZIP
)
CREATE TABLE ORDERS(
  OrderID,		    -- Primary Key (1NFa)
  CustomerID,
  ProductID,
  /*ProductName,*/	-- This column doesn't depend on PK OrderID, but on ProductID: therefore, we'll move it to the new table Products (3NF)
  PurchasePrice,
  Quantity,
  /*Total*/		      -- This value can be derived by multiplying PurchasePrice and Quantity, so we'll remove it from the table (3NF)
)
CREATE TABLE Products(
  ProductID,      --PK
  ProductName
)

/*
+ 4NF: Isolate interdependent multiple relationships
+ 5NF: Isolate semantically related multiple relationships
*/
