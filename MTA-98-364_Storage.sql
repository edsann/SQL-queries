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
+ 1NF: Eliminate repeating groups
  - Establish a primary identifier (1NFa)
  - Remove multivalued attributes (1NFb)
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
+ 2NF: Eliminate redundant data
  - The database must be in 1NF
  - Move redundant data into related tables
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
+ 3NF: Eliminate columns not dependent on key fields
  - The database must be in 2NF
  - Remove transitively dependent data that does not depend on key
*/
CREATE TABLE Customers(
  CustomerID,
  CustomerFirstName,
  CustomerLastName,
  StreetAddress,
  City,
  State,
  ZIP
)
CREATE TABLE CustomerPhone(
  PhoneNumber,        -- Composite Primary Key (1NFa)
  CustomerID          -- Composite Primary Key (1NFa)
  PhoneType
)
CREATE TABLE CustomerCreditCard(
  CreditCardNumber,   -- Composite Primary Key (1NFa)
  CustomerID,         -- Composite Primary Key (1NFa)
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
CREATE TABLE ORDERS(
  OrderID,		    -- Primary Key (1NFa)
  CustomerID,
  ProductID,
  /*ProductName,*/	-- Moved to the new table Products, since it doesn't depend on PK OrderID, but on ProductID (3NF)
  PurchasePrice,
  Quantity,
  /*Total*/		      -- Removed, it can be derived with PurchasePrice*Quantity (3NF)
)

/*
+ 4NF: Isolate interdependent multiple relationships
+ 5NF: Isolate semantically related multiple relationships
*/
