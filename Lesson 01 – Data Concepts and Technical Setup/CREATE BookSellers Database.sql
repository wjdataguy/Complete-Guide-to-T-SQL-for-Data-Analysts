/**********************************************************
AddedBySCRIPT NAME: sqlTables.sql
CREATED BY: CHRIS SORENSEN
CREATED DATE: SEPTEMBER 03, 2003
DESCRITION: SCRIPT USED TO BUILD THE OBJECTS NEEDED FOR
THE BOOK SELLERS DATABASE SCHEMA

Modifications: 
February 17, 2025 - Added Schemas and changed database values

***********************************************************/

-----------------------------------------------------------
--THE CREATE DATABASE SYNTAX WILL GO AHEAD AND SET UP A 
--DATABASE WITH THE FOLLOWING NAME. THINK OF THIS AS A
--CONTAINER FOR ALL OF YOUR TABLE OBJECTS AND EVERYTHING
--ELSE THAT WE WILL CREATE IN THIS CLASS. YOU WILL OFTEN
--HEAR ME REFER TO TABLES, VIEWS, CONTRAINTS AS "OBJECTS"
--SOMETIMES THIS IS HARD TO UNDERSTAND AND YOU NEED TO DO
--SOME MENTAL ABSTRACTION. ONCE YOUR DATABASE HAS BEEN SET
--UP, COMMENT THE LINE OUT.
-----------------------------------------------------------
--NOTE: THIS IS THE MINIMUM SYNTAX NEEDED TO CREATE A
--DATATBASE.
-----------------------------------------------------------
--NOTE: THE USE OF "GO" IN THE SCRIPT IS JUST TELLING THE 
--SCRIPT WINDOW TO SUBMIT EVERYTHING TO THIS POINT (BETWEEN
--GOS) TO THE DATABASE
-----------------------------------------------------------
--
/*
USE master
GO
*/

CREATE DATABASE BookSellers

GO

-----------------------------------------------------------
--NOW THAT A DATABASE IS CREATED, WE NEED TO TELL THE
--SCRIPT ENGINE TO CREATE THE OBJECTS IN THAT DATABASE
--THAT IS WHAT "USE" DOES. IF YOU HIGHLIGHT AND RUN THIS
--YOU WILL NOTICE THE DROP DOWN BOX AT THE TOP OF THE
--SCEREEN CHANGE, IF IS IT IS A DIFFERENT DATABASE OF COURSE.
-----------------------------------------------------------

USE BookSellers

GO

-----------------------------------------------------------
--WE WILL NEED THIS SETTING TURNED ON LATER IN THE CLASS
--SO LET IT RUN NOW AND I WILL EXPLAIN IT FURTHUR DURING
--THE CLASS. THIS LINE CAN ALSO BE COMMENTED OUT AFTER
--THE SCRIPT IS RUN FOR THE FIRST TIME.
-------------------------------------------------------------
ALTER DATABASE BookSellers SET RECOVERY BULK_LOGGED
ALTER DATABASE BookSellers SET RECOVERY FULL

GO

-----------------------------------------------------------
--This setting stops the message indicating the number of 
--rows affected by a Transact-SQL statement from being 
--returned as part of the results.
-----------------------------------------------------------
SET NOCOUNT ON

GO


CREATE SCHEMA [HumanResources] AUTHORIZATION [dbo];
GO

CREATE SCHEMA [Purchasing] AUTHORIZATION [dbo];
GO

CREATE SCHEMA [Sales] AUTHORIZATION [dbo];
GO

CREATE SCHEMA [MasterData] AUTHORIZATION [dbo];
GO

CREATE SCHEMA [Demo] AUTHORIZATION [dbo];
GO

-----------------------------------------------------------
--WHENEVER YOU NEED TO DROP AND RECREATE YOUR TABLE OBJECTS
--JUST HIGHLIGHT ALL OF THE STATEMENTS BETWEEN THE /* */
--NOTICE THAT THE ORDER THAT WE DROP SCRIPTS IS THE EXACT
--OPPOSITE OF THE WAY THEY ARE CREATED IN THE SCRIPT
-----------------------------------------------------------

/*
DROP TABLE Purchasing.NumberOfBooksSuppliedBySupplier
DROP TABLE Sales.TaxTable
DROP TABLE Purchasing.BookSupplier
DROP TABLE Purchasing.Supplier
DROP TABLE Sales.OrderDetail
DROP TABLE Sales.OrderHeader
DROP TABLE Sales.Customer
DROP TABLE HumanResources.Employee
DROP TABLE Purchasing.Book
DROP TABLE Purchasing.Category
DROP TABLE MasterData.Province
DROP TABLE MasterData.Country
*/

------------------------------------------
--CREATE TABLE OBJECT
------------------------------------------

--DROP TABLE MasterData.Country

PRINT 'START CREATE TABLE MasterData.Country'

GO

CREATE TABLE MasterData.Country (
CountryID		VARCHAR(2)	NOT NULL,
CountryName		VARCHAR(30)	NOT NULL,
AddedDate		DATETIME	NOT NULL,
AddedBy			VARCHAR(100)	NOT NULL,
ModifiedDate	DATETIME	NOT NULL,
ModifiedBy		VARCHAR(100)	NOT NULL)

GO

PRINT 'END CREATE TABLE MasterData.Country'

GO

------------------------------------------
--CONSTRAINTS
------------------------------------------

PRINT 'START CONSTRAINTS FOR TABLE MasterData.Country'

GO

ALTER TABLE MasterData.Country
	ADD CONSTRAINT pk_country
	PRIMARY KEY NONCLUSTERED (countryID)

GO

PRINT 'END CONSTRAINTS FOR TABLE MasterData.Country'
PRINT ''

GO

------------------------------------------
--INITIAL INSERTS
------------------------------------------

INSERT INTO MasterData.Country VALUES ('CA', 'Canada', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Country VALUES ('GB', 'United Kingdom', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Country VALUES ('US', 'United States', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Country VALUES ('MX', 'Mexico', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

GO

------------------------------------------
--CREATE TABLE OBJECT
------------------------------------------

PRINT 'START CREATE TABLE MasterData.Province'

GO

--DROP TABLE MasterData.Province

CREATE TABLE MasterData.Province (
ProvinceID		INTEGER		NOT NULL,
ProvinceName		VARCHAR(30)	NOT NULL,
ProvinceCountryID	VARCHAR(2)	NOT NULL,
AddedDate		DATETIME	NOT NULL,
AddedBy			VARCHAR(100)	NOT NULL,
ModifiedDate		DATETIME	NOT NULL,
ModifiedBy		VARCHAR(100)	NOT NULL)

GO

PRINT 'END CREATE TABLE MasterData.Province'

GO

------------------------------------------
--CONSTRAINTS
------------------------------------------

PRINT 'START CONSTRAINTS FOR TABLE MasterData.Province'

GO

ALTER TABLE MasterData.Province
	ADD CONSTRAINT pk_province
	PRIMARY KEY NONCLUSTERED (provinceID)

ALTER TABLE MasterData.Province
	ADD CONSTRAINT fk_province_provinceCountryID
	FOREIGN KEY (provinceCountryID) REFERENCES MasterData.Country(countryID)

GO

PRINT 'END CONSTRAINTS FOR TABLE MasterData.Province'
PRINT ''

GO

------------------------------------------
--INITIAL INSERTS
------------------------------------------

INSERT INTO MasterData.Province VALUES (1, 'Alberta', 'CA', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (2, 'British Columbia', 'CA', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (3, 'Manitoba', 'CA', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (4, 'New Brunswick', 'CA', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (5, 'Newfoundland', 'CA', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (6, 'Northwest Territories', 'CA', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (7, 'Nova Scotia', 'CA', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (8, 'Nunavat', 'CA', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (9, 'Ontario', 'CA', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (10, 'Prince Edward Island', 'CA', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (11, 'Quebec', 'CA', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (12, 'Saskatchewan', 'CA', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (13, 'Yukon', 'CA', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (14, 'Alabama', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (15, 'Alaska', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (16, 'Arizona', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (17, 'Arkansas', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (18, 'California', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (19, 'Colorado', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (20, 'Connecticut', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (21, 'Delaware', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (22, 'District of Columbia', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (23, 'Florida', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (24, 'Georgia', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (25, 'Hawaii', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (26, 'Idaho', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (27, 'Illinois', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (28, 'Indiana', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (29, 'Iowa', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (30, 'Kansas', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (31, 'Kentucky', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (32, 'Louisiana', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (33, 'Maine', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (34, 'Maryland', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (35, 'Massachusetts', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (36, 'Michigan', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (37, 'Minnesota', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (38, 'Mississippi', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (39, 'Missouri', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (40, 'Montana', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (41, 'Nebraska', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (42, 'Nevada', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (43, 'New Hampshire', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (44, 'New Jersey', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (45, 'New Mexico', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (46, 'New York', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (47, 'North Carolina', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (48, 'North Dakota', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (49, 'Ohio', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (50, 'Oklahoma', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (51, 'Oregon', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (52, 'Pennsylvania', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (53, 'Rhode Island', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (54, 'South Carolina', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (55, 'South Dakota', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (56, 'Tennessee', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (57, 'Texas', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (58, 'Utah', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (59, 'Vermont', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (60, 'Virginia', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (61, 'Virgin Islands', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (62, 'Washington', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (63, 'West Virginia', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (64, 'Wisconsin', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO MasterData.Province VALUES (65, 'Wyoming', 'US', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

GO

------------------------------------------
--CREATE TABLE TAX TABLE
------------------------------------------

--DROP TABLE Sales.TaxTable

PRINT 'START CREATE TABLE Sales.TaxTable'

GO

CREATE TABLE Sales.TaxTable (
TaxID			INTEGER		NOT NULL,
TaxName			VARCHAR(50)	NOT NULL,
Rate			NUMERIC(2,2)	NOT NULL,
StartDate		DATETIME	NOT NULL,
EndDate			DATETIME	NOT NULL,
AddedDate		DATETIME	NOT NULL,
AddedBy			VARCHAR(100)	NOT NULL,
ModifiedDate		DATETIME	NOT NULL,
ModifiedBy		VARCHAR(100)	NOT NULL)

GO

PRINT 'END CREATE TABLE Sales.TaxTable'

------------------------------------------
--CONSTRAINTS
------------------------------------------

PRINT 'START CONSTRAINTS FOR TABLE Sales.TaxTable'

GO

ALTER TABLE Sales.TaxTable
	ADD CONSTRAINT pk_taxTable
	PRIMARY KEY NONCLUSTERED (TaxID)

GO

PRINT 'END CONSTRAINTS FOR TABLE Sales.TaxTable'
PRINT ''

GO

------------------------------------------
--INITIAL INSERTS
------------------------------------------

INSERT INTO Sales.TaxTable VALUES (1, 'GST', 0.10, '01-JAN-1990', '31-DEC-2021',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.TaxTable VALUES (2, 'GST', 0.20, '01-JAN-2022', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

------------------------------------------
--CREATE TABLE OBJECT
------------------------------------------

--DROP TABLE Purchasing.Category

PRINT 'START CREATE TABLE Purchasing.Category'

GO

CREATE TABLE Purchasing.Category (
CategoryID		INTEGER		NOT NULL,
CategoryName		VARCHAR(50)	NOT NULL,
CommissionRate		NUMERIC(2,2)	NOT NULL,
AddedDate		DATETIME	NOT NULL,
AddedBy			VARCHAR(100)	NOT NULL,
ModifiedDate		DATETIME	NOT NULL,
ModifiedBy		VARCHAR(100)	NOT NULL)

GO

PRINT 'END CREATE TABLE Purchasing.Category'

GO

------------------------------------------
--CONSTRAINTS
------------------------------------------

PRINT 'START CONSTRAINTS FOR TABLE Purchasing.Category'

GO

ALTER TABLE Purchasing.Category
	ADD CONSTRAINT pk_category
	PRIMARY KEY NONCLUSTERED (CategoryID)

ALTER TABLE Purchasing.Category
	ADD CONSTRAINT ck_category_commissionRate
	CHECK (CommissionRate BETWEEN 0.00 AND 0.99)

GO

PRINT 'END CONSTRAINTS FOR TABLE Purchasing.Category'
PRINT ''

GO

------------------------------------------
--INITIAL INSERTS
------------------------------------------

INSERT INTO Purchasing.Category VALUES (1, 'Computers', 0.03, getDate(), 
SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Category VALUES (2, 'Philosophy', 0.02, getDate(), 
SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Category VALUES (3, 'Cooking', 0.02, getDate(), 
SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Category VALUES (4, 'Romance', 0.06, getDate(), 
SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Category VALUES (5, 'Travel', 0.05, getDate(), 
SUSER_NAME(), getDate(), SUSER_NAME())

GO

------------------------------------------
--CREATE TABLE OBJECT
------------------------------------------

--DROP TABLE Purchasing.Book

PRINT 'START CREATE TABLE Purchasing.Book'

GO

CREATE TABLE Purchasing.Book (
BookID			INTEGER		NOT NULL,
BookTitle		VARCHAR(100)	NOT NULL,
CategoryID		INTEGER		NOT NULL,
UnitCost		MONEY		NOT NULL,
UnitPrice		MONEY		NOT NULL,
UnitsInInventory	INTEGER		NOT NULL,
UnitReOrderLevel	INTEGER		NOT NULL,
Discontinued		VARCHAR(1)	NOT NULL,
AddedDate		DATETIME	NOT NULL,
AddedBy			VARCHAR(100)	NOT NULL,
ModifiedDate		DATETIME	NOT NULL,
ModifiedBy		VARCHAR(100)	NOT NULL)

GO

PRINT 'END CREATE TABLE Purchasing.Book'

GO

------------------------------------------
--CONSTRAINTS
------------------------------------------

PRINT 'START CONSTRAINTS FOR TABLE Purchasing.Book'

GO

ALTER TABLE Purchasing.Book
	ADD CONSTRAINT pk_book
	PRIMARY KEY NONCLUSTERED (BookID)

ALTER TABLE Purchasing.Book
	ADD CONSTRAINT fk_book_categoryID
	FOREIGN KEY (CategoryID) REFERENCES Purchasing.Category(CategoryID)

ALTER TABLE Purchasing.Book
	ADD CONSTRAINT ck_book_unitCost
	CHECK (UnitCost >= 0.0000)

ALTER TABLE Purchasing.Book
	ADD CONSTRAINT ck_book_unitsInInventory
	CHECK (UnitsInInventory >= 0)

ALTER TABLE Purchasing.Book
	ADD CONSTRAINT ck_book_unitReOrderLevel
	CHECK (UnitReOrderLevel >= 0)

ALTER TABLE Purchasing.Book
	ADD CONSTRAINT ck_book_discontinued
	CHECK (Discontinued IN ('Y', 'N'))

GO

PRINT 'END CONSTRAINTS FOR TABLE Purchasing.Book'
PRINT ''

GO

------------------------------------------
--INITIAL INSERTS
------------------------------------------

INSERT INTO Purchasing.Book VALUES (1, 'Professional SQL Server 2022 Programming', 1, 9.89, 10.99, 1, 5, 
	'N', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Book VALUES (2, 'SQL Server 2022 Programming by Example', 1, 65.69, 72.99, 52, 10, 
	'N', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Book VALUES (3, 'Web Application Construction, Fifth Edition', 1, 65.69, 72.99, 6, 5, 
	'N', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Book VALUES (4, 'Kitchen Confidential', 3, 9.89, 10.99, 8, 10, 
	'N', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Book VALUES (5, 'The Silver Palate Cookbook', 3, 9.89, 10.99, 12, 10, 
	'Y', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Book VALUES (6, 'Cooking Thai', 3, 28.69, 42.99, 9, 10, 
	'N', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Book VALUES (7, 'Bar-B-Que Masterpieces', 3, 79.99, 99.99, 10, 10, 
	'N', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Book VALUES (8, 'Before I Wake', 4, 5.49, 5.99, 4, 5, 
	'N', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Book VALUES (9, 'A Perfect Love', 4, 9.89, 10.99, 5, 5, 
	'N', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Book VALUES (10, 'Broken Wings', 4, 29.69, 32.99, 0, 5, 
	'Y', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Book VALUES (11, 'Jade Island', 4, 37.79, 41.99, 15, 5, 
	'N', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Book VALUES (12, 'Born in Ice', 4, 47.69, 52.99, 8, 5, 
	'N', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Book VALUES (13, 'The Unofficial Guide to the World''s Best Diving Vacations', 5, 9.89, 10.99, 0, 5, 
	'N', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Book VALUES (14, 'The Rough Guide to Belize: Includes Tikal and the Bay Islands', 5, 14.39, 15.99, 3, 5, 
	'N', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.Book VALUES (15, 'Frommers Japan 2025', 5, 15.29, 16.99, 50, 10, 
	'Y', getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

GO

------------------------------------------
--CREATE TABLE OBJECT
------------------------------------------

--DROP TABLE HumanResources.Employee

PRINT 'START CREATE TABLE HumanResources.Employee'

GO

CREATE TABLE HumanResources.Employee (
EmployeeID		INTEGER		NOT NULL,
FirstName		VARCHAR(35)	NOT NULL,
LastName		VARCHAR(50)	NOT NULL,
Title			VARCHAR(25)	NULL,
Salary			MONEY		NULL,
HireDate		DATETIME	NOT NULL,
BirthDate		DATETIME	NOT NULL,
ReportsToID		INTEGER		NULL,
AddressLine		VARCHAR(50)	NULL,
PostalCode		VARCHAR(15)	NULL,
City			VARCHAR(20)	NULL,
ProvinceID		INTEGER		NULL,
CountryID		VARCHAR(2)	NULL,
Phone			VARCHAR(20)	NULL,
Email			VARCHAR(50)	NULL,
AddedDate		DATETIME	NOT NULL,
AddedBy			VARCHAR(100)	NOT NULL,
ModifiedDate		DATETIME	NOT NULL,
ModifiedBy		VARCHAR(100)	NOT NULL)

GO

PRINT 'END CREATE TABLE HumanResources.Employee'

GO

------------------------------------------
--CONSTRAINTS
------------------------------------------

PRINT 'START CONSTRAINTS FOR TABLE HumanResources.Employee'

GO

ALTER TABLE HumanResources.Employee
	ADD CONSTRAINT pk_employee
	PRIMARY KEY NONCLUSTERED (EmployeeID)

ALTER TABLE HumanResources.Employee
	ADD CONSTRAINT fk_employee_reportsToID
	FOREIGN KEY (ReportsToID) REFERENCES HumanResources.Employee(EmployeeID)

ALTER TABLE HumanResources.Employee
	ADD CONSTRAINT fk_employee_province
	FOREIGN KEY (ProvinceID) REFERENCES MasterData.Province(ProvinceID)

ALTER TABLE HumanResources.Employee
	ADD CONSTRAINT fk_employee_country
	FOREIGN KEY (CountryID) REFERENCES MasterData.Country(CountryID)

GO

PRINT 'END CONSTRAINTS FOR TABLE HumanResources.Employee'
PRINT ''

GO

------------------------------------------
--INITIAL INSERTS
------------------------------------------

INSERT INTO HumanResources.Employee VALUES (1, 'Elaine', 'Bennisson', 'CEO', 
100000.00, '23-OCT-1995', '15-AUG-1965', 
	NULL, '78 Park Drive', '89898-90', 'New York', 46, 'US', '(234) 
566-8998', 'elaine.bennisson@wholesalebooks.com',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO HumanResources.Employee VALUES (2, 'Joey', 'Gleckenheim', 'SALES MANAGER', 
85000.00, '23-OCT-1995', '10-APR-1973', 
	1, '78 Park Drive', '89898-90', 'New York', 46, 'US', '(234) 
566-8999', 'joey.gleckenheim@wholesalebooks.com',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO HumanResources.Employee VALUES (3, 'David', 'Puddyland', 'SALES', 
60000.00, '10-JAN-1996', '31-JUL-1978', 
	2, '23 Memorial Drive', 'T2K-8H6', 'Calgary', 1, 'CA', '(403) 
222-6789', 'david.puddyland@wholesalebooks.com',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO HumanResources.Employee VALUES (4, 'Tim', 'Watman', 'SALES', 
55000.00,'15-FEB-1999', '09-MAY-1960', 
	2, '67 Robson Street', 'G6J-7U8', 'Vancouver', 2, 'CA', '(604) 
463-8465', 'tim.watman@wholesalebooks.com',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO HumanResources.Employee VALUES (5, 'Cosmo', 'Kruger', 'SALES', 
40000.00,'08-JUN-2002', '10-AUG-1960', 
	2, '89 Pepsee Center Way', '45898-91', 'Denver', 19, 'US', '(789) 
354-8490', 'cosmo.kruger@wholesalebooks.com',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO HumanResources.Employee VALUES (6, 'Gene', 'Watson', 'SALES', 57500.00, 
'08-SEP-2003', '10-AUG-1965', 
	2, '89 Pepsee Center Way', '45898-91', 'Denver', 19, 'US', '(789) 
354-8491', 'genewatson@wholesalebooks.com',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO HumanResources.Employee VALUES (7, 'Kim', 'Watson', 'SALES', NULL, 
'08-JAN-2013', '10-JUN-1975', 
	2, '67 Robson Street', 'G6J-7U8', 'Vancouver', 2, 'CA', '(604) 
463-8484', 'geneawatson@wholesalebooks.com',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO HumanResources.Employee VALUES (8, 'Addison', 'Watson', 'MARKETING', NULL, 
'31-JUL-2017', '10-OCT-1985', 
	2, '67 Robson Street', 'G6J-7U8', 'Vancouver', 2, 'CA', '(604) 
463-8486', 'adisonwatson@wholesalebooks.com',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO HumanResources.Employee VALUES (9, 'Julie', 'Ling', 'SALES MANAGER', 45000, 
'01-OCT-2020', '10-MAR-1990', 
	2, '67 Robson Street', 'G6J-7U8', 'Vancouver', 2, 'CA', '(604) 
463-8487', 'julieling@wholesalebooks.com',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())


INSERT INTO HumanResources.Employee VALUES (10, 'Leslie', 'Jones', 'MARKETING JUNIOR', 35000, 
'01-OCT-2020', '13-DEC-1990', 
	2, '67 Robson Street', 'G6J-7U8', 'Vancouver', 2, 'CA', '(604) 
463-8490', 'lesliejones@wholesalebooks.com',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())


INSERT INTO HumanResources.Employee VALUES (11, 'Jim', 'Sky', 'CREATIVE MARKETING', 35000, 
'01-OCT-2020', '13-DEC-2000', 
	2, '67 Robson Street', 'G6J-7U8', 'Vancouver', 2, 'CA', '(604) 
463-8495', 'jisky@wholesalebooks.com',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO HumanResources.Employee VALUES (12, 'Janice', 'Galvin', 'HR GENERALIST', 60000, 
'01-OCT-2020', '03-FEB-1995', 
	2, '67 Robson Street', 'G6J-7U8', 'Vancouver', 2, 'CA', '(604) 
463-8499', 'janicegalvin@wholesalebooks.com',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())



GO

------------------------------------------
--CREATE TABLE OBJECT
------------------------------------------

--DROP TABLE Sales.Customer

PRINT 'START CREATE TABLE Sales.Customer'

GO

CREATE TABLE Sales.Customer (
CustomerID		INTEGER		NOT NULL,
CustomerName		VARCHAR(100)	NOT NULL,
ContactFirstName	VARCHAR(35)	NULL,
ContactLastName		VARCHAR(50)	NULL,
EmployeeID		INTEGER		NULL,
AddressLine			VARCHAR(50)	NULL,
PostalCode		VARCHAR(15)	NULL,
City			VARCHAR(20)	NULL,
ProvinceID		INTEGER		NULL,
CountryID		VARCHAR(2)	NULL,
Phone			VARCHAR(20)	NULL,
Email			VARCHAR(50)	NULL,
CustomerStatus		VARCHAR(1)	NOT NULL,
AddedDate		DATETIME	NOT NULL,
AddedBy			VARCHAR(100)	NOT NULL,
ModifiedDate		DATETIME	NOT NULL,
ModifiedBy		VARCHAR(100)	NOT NULL)

GO

PRINT 'END CREATE TABLE Sales.Customer'

GO

------------------------------------------
--CONSTRAINTS
------------------------------------------

PRINT 'START CONSTRAINTS FOR TABLE Sales.Customer'

GO

ALTER TABLE Sales.Customer
	ADD CONSTRAINT pk_customer
	PRIMARY KEY NONCLUSTERED (CustomerID)

ALTER TABLE Sales.Customer
	ADD CONSTRAINT fk_customer_employeeID
	FOREIGN KEY (EmployeeID) REFERENCES HumanResources.Employee(EmployeeID)

ALTER TABLE Sales.Customer
	ADD CONSTRAINT fk_customer_province
	FOREIGN KEY (ProvinceID) REFERENCES MasterData.Province(ProvinceID)

ALTER TABLE Sales.Customer
	ADD CONSTRAINT fk_customer_country
	FOREIGN KEY (CountryID) REFERENCES MasterData.Country(CountryID)

ALTER TABLE Sales.Customer
	ADD CONSTRAINT ck_customer_status
	CHECK (CustomerStatus IN ('A', 'I'))

GO

PRINT 'END CONSTRAINTS FOR TABLE Sales.Customer'
PRINT ''

GO

------------------------------------------
--INITIAL INSERTS
------------------------------------------

INSERT INTO Sales.Customer VALUES (1, 'The Trendy Bookstore', 'Morty', 
'Sein', 3,
	'67 Barlow Trail', 'T5H-7U7', 'Calgary', 1, 'CA', '(403) 245-7283', 
'george@ttb.com', 'A',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.Customer VALUES (2, 'Chatters Inc', 'Jackie', 'Chill', 
3,
	'34 Chinook Way', 'T4R-5Y7', 'Calgary', 1, 'CA', '(403) 289-7683', 
'jackie@chatters.com', 'A',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.Customer VALUES (3, 'Dot Com Book World', 'George', 
'Cosza', 4,
	'67 Granville Island', 'B5H-4U7', 'Vancouver', 2, 'CA', '(604) 245-7283', NULL, 'I',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.Customer VALUES (4, 'Metcalfs Book Zone', 'Leo', 
'Manfred', 5,
	'100 Coke Plaza', '83746-837', 'Boulder', 19, 'US', '(789) 837-7473', 
'leo@ttb.com', 'A',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.Customer VALUES (5, 'All Books', 'Joe', 'Divorsky', 4,
	'38 Canada Way', 'B6H-8U6', 'Burnaby', 2, 'CA', '(604) 245-7283', 
'joe@allbooks.com', 'A',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())


INSERT INTO Sales.Customer VALUES (6, 'Book Corner', 'Janice', 'Timmons', 4,
	'40 Canada Way', 'B6H-8U6', 'Burnaby', 2, 'CA', NULL, NULL, 'A',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.Customer VALUES (7, 'Hole in the wall', 'Gene', 'Watson', 6,
	'32 Avalanche road', '83746-837', 'Denver', 19, 'US', NULL, NULL, 'A',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

GO

------------------------------------------
--CREATE TABLE OBJECT
------------------------------------------

--DROP TABLE Sales.OrderHeader

PRINT 'START CREATE TABLE Sales.OrderHeader'

GO

CREATE TABLE Sales.OrderHeader (
OrderHeaderID		INTEGER		NOT NULL,
CustomerID		INTEGER		NOT NULL,
OrderDate		DATETIME	NOT NULL,
ShippedDate		DATETIME	NULL,
AddedDate		DATETIME	NOT NULL,
AddedBy			VARCHAR(100)	NOT NULL,
ModifiedDate		DATETIME	NOT NULL,
ModifiedBy		VARCHAR(100)	NOT NULL)

GO

PRINT 'END CREATE TABLE Sales.OrderHeader'

GO

------------------------------------------
--CONSTRAINTS
------------------------------------------

PRINT 'START CONSTRAINTS FOR TABLE Sales.OrderHeader'

GO

ALTER TABLE Sales.OrderHeader
	ADD CONSTRAINT pk_orderHeader
	PRIMARY KEY NONCLUSTERED (OrderHeaderID)

ALTER TABLE Sales.OrderHeader
	ADD CONSTRAINT fk_orderHeader_customerID
	FOREIGN KEY (CustomerID) REFERENCES Sales.Customer(CustomerID)

ALTER TABLE Sales.OrderHeader
	ADD CONSTRAINT ck_orderHeader_shippedDate
	CHECK (ShippedDate >= OrderDate)

PRINT 'END CONSTRAINTS FOR TABLE Sales.OrderHeader'
PRINT ''

GO

------------------------------------------
--INITIAL INSERTS
------------------------------------------

INSERT INTO Sales.OrderHeader VALUES (1, 1, '10-JUN-2021', '11-JUN-2021',
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderHeader VALUES (2, 1, '17-SEP-2021', '30-SEP-2021',
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderHeader VALUES (3, 1, '25-JAN-2022', '30-JAN-2022',
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())


INSERT INTO Sales.OrderHeader VALUES (4, 2, '10-AUG-2023', '12-AUG-2023',
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderHeader VALUES (5, 2, '09-SEP-2023', '10-SEP-2023',
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderHeader VALUES (6, 4, '09-SEP-2024', NULL,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())


INSERT INTO Sales.OrderHeader VALUES (7, 3, '21-MAY-2021', '21-MAY-2021',
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.OrderHeader VALUES (8, 4, '01-FEB-2024', '11-FEB-2024',
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderHeader VALUES (9, 4, '03-MAR-2024', '04-MAR-2024',
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderHeader VALUES (10, 4, '07-MAY-2024', '08-MAY-2024',
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderHeader VALUES (11, 4, '18-JUL-2024', '29-JUL-2024',
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderHeader VALUES (12, 4, '08-SEP-2024', NULL,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

GO

------------------------------------------
--CREATE TABLE OBJECT
------------------------------------------

--DROP TABLE Sales.OrderDetail

PRINT 'START CREATE TABLE Sales.OrderDetail'

GO

CREATE TABLE Sales.OrderDetail (
OrderHeaderID		INTEGER		NOT NULL,
OrderDetailID		INTEGER		NOT NULL,
BookID			INTEGER		NOT NULL,
UnitPrice		MONEY		NOT NULL,		
Quantity		INTEGER		NOT NULL,
AddedDate		DATETIME	NOT NULL,
AddedBy			VARCHAR(100)	NOT NULL,
ModifiedDate		DATETIME	NOT NULL,
ModifiedBy		VARCHAR(100)	NOT NULL)

GO

PRINT 'END CREATE TABLE Sales.OrderDetail'

GO

------------------------------------------
--CONSTRAINTS
------------------------------------------

PRINT 'START CONSTRAINTS FOR TABLE Sales.OrderDetail'

GO

ALTER TABLE Sales.OrderDetail
	ADD CONSTRAINT pk_orderDetail
	PRIMARY KEY NONCLUSTERED (OrderHeaderID, OrderDetailID)

ALTER TABLE Sales.OrderDetail
	ADD CONSTRAINT fk_orderDetail_orderHeaderID
	FOREIGN KEY (OrderHeaderID) REFERENCES Sales.OrderHeader(OrderHeaderID)

ALTER TABLE Sales.OrderDetail
	ADD CONSTRAINT fk_orderDetail_bookID
	FOREIGN KEY (BookID) REFERENCES Purchasing.Book(BookID)

ALTER TABLE Sales.OrderDetail
	ADD CONSTRAINT ck_orderDetail_quantity
	CHECK (Quantity >= 0)

PRINT 'END CONSTRAINTS FOR TABLE Sales.OrderDetail'
PRINT ''

GO

------------------------------------------
--INITIAL INSERTS
------------------------------------------

INSERT INTO Sales.OrderDetail VALUES (1, 1, 1, 10.99, 6,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (1, 2, 5, 10.99, 2,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (1, 3, 8, 5.99, 7,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (1, 4, 15, 16.99, 1,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.OrderDetail VALUES (2, 1, 2, 72.99, 9,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (2, 2, 5, 10.99, 4,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.OrderDetail VALUES (3, 1, 3, 72.99, 1,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (3, 2, 4, 10.99, 3,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (3, 3, 7, 99.99, 4,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.OrderDetail VALUES (4, 1, 13, 10.99, 10,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (4, 2, 14, 15.99, 5,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.OrderDetail VALUES (5, 1, 10, 32.99, 3,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.OrderDetail VALUES (6, 2, 11, 41.99, 2,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.OrderDetail VALUES (7, 1, 3, 72.99, 4,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (7, 2, 4, 10.99, 3,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (7, 3, 7, 99.99, 2,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (7, 4, 6, 42.99, 2,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (7, 5, 1, 10.99, 1,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.OrderDetail VALUES (8, 1, 13, 10.99, 10,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (8, 2, 14, 15.99, 5,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.OrderDetail VALUES (9, 1, 2, 72.99, 2,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (9, 2, 3, 72.99, 3,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.OrderDetail VALUES (10, 1, 13, 10.99, 4,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.OrderDetail VALUES (11, 1, 1, 10.99, 3,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (11, 2, 2, 72.99, 5,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Sales.OrderDetail VALUES (12, 1, 2, 72.99, 6,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (12, 2, 4, 10.99, 3,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (12, 3, 8, 5.99, 1,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Sales.OrderDetail VALUES (12, 4, 7, 99.99, 5,
	 getDate(), SUSER_NAME(), getDate(), SUSER_NAME())


------------------------------------------
--CREATE TABLE OBJECT
------------------------------------------

--DROP TABLE Purchasing.Supplier

PRINT 'START CREATE TABLE Purchasing.Supplier'

GO

CREATE TABLE Purchasing.Supplier (
SupplierID		INTEGER		NOT NULL,
SupplierName		VARCHAR(100)	NOT NULL,
ContactFirstName	VARCHAR(35)	NULL,
ContactLastName		VARCHAR(50)	NULL,
AddressLine			VARCHAR(50)	NULL,
PostalCode		VARCHAR(15)	NULL,
City			VARCHAR(20)	NULL,
ProvinceID		INTEGER		NULL,
CountryID		VARCHAR(2)	NULL,
Phone			VARCHAR(20)	NULL,
Email			VARCHAR(50)	NULL,
NumberOfBooks		INTEGER		NULL,
SupplierStatus			VARCHAR(1)	NOT NULL,
AddedDate		DATETIME	NOT NULL,
AddedBy			VARCHAR(100)	NOT NULL,
ModifiedDate		DATETIME	NOT NULL,
ModifiedBy		VARCHAR(100)	NOT NULL)

GO

PRINT 'END CREATE TABLE Purchasing.Supplier'

GO

------------------------------------------
--CONSTRAINTS
------------------------------------------

PRINT 'START CONSTRAINTS FOR TABLE Purchasing.Supplier'

GO

ALTER TABLE Purchasing.Supplier
	ADD CONSTRAINT pk_supplier
	PRIMARY KEY NONCLUSTERED (SupplierID)

ALTER TABLE Purchasing.Supplier
	ADD CONSTRAINT fk_supplier_province
	FOREIGN KEY (ProvinceID) REFERENCES MasterData.Province(ProvinceID)

ALTER TABLE Purchasing.Supplier
	ADD CONSTRAINT fk_supplier_country
	FOREIGN KEY (CountryID) REFERENCES MasterData.Country(CountryID)

ALTER TABLE Purchasing.Supplier
	ADD CONSTRAINT ck_supplier_status
	CHECK (SupplierStatus IN ('A', 'I'))

GO

PRINT 'END CONSTRAINTS FOR TABLE Purchasing.Supplier'
PRINT ''

GO

------------------------------------------
--INITIAL INSERTS
------------------------------------------

INSERT INTO Purchasing.Supplier VALUES (1, 'McNallee', 'Mark', 'Smith',
	'67 Balow Mills Way', '15627-8933', 'Dallas', 57, 'US', '(782) 
364-8364', 'mark@mcnalleecc.com', NULL, 'A',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Purchasing.Supplier VALUES (2, 'Pendant Haus', 'Julie', 'Smith',
	'34 Plantation Road', '63748-7232', 'Portland', 51, 'US', '(463) 
834-7383', 'julie@pendanthauscc.com', NULL, 'A',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Purchasing.Supplier VALUES (3, 'Random Haus', 'George', 'Wells',
	'267 Granville Island', 'B5H-4U7', 'Vancouver', 2, 'CA', '(604) 
245-7283', 'george@randomhauscc.com', NULL, 'A',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Purchasing.Supplier VALUES (4, 'Putnam and Sons', 'Leon', 'Sayer',
	'21 Airport Way', 'T5H-3U7', 'Calgary', 1, 'CA', '(403) 356-7283', 
'leo@putnamsonscc.ca', NULL, 'I',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

INSERT INTO Purchasing.Supplier VALUES (5, 'Microsoft Press', 'Bill', 'Grosswell',
	'2 Brage Way', '18736-984', 'Vancouver', 62, 'US', '(457) 567-3453', 
'bill@mspresscc.com', NULL, 'A',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

------------------------------------------
--CREATE TABLE OBJECT
------------------------------------------

--DROP TABLE Purchasing.BookSupplier

PRINT 'START CREATE TABLE Purchasing.BookSupplier'

GO

CREATE TABLE Purchasing.BookSupplier (
BookID			INTEGER		NOT NULL,
SupplierID		INTEGER		NOT NULL,
StartDate		DATETIME	NOT NULL,
EndDate			DATETIME	NOT NULL,
AddedDate		DATETIME	NOT NULL,
AddedBy			VARCHAR(100)	NOT NULL,
ModifiedDate		DATETIME	NOT NULL,
ModifiedBy		VARCHAR(100)	NOT NULL)

GO

PRINT 'END CREATE TABLE Purchasing.BookSupplier'

GO

------------------------------------------
--CONSTRAINTS
------------------------------------------

PRINT 'START CONSTRAINTS FOR TABLE Purchasing.BookSupplier'

GO

ALTER TABLE Purchasing.BookSupplier
	ADD CONSTRAINT pk_bookSupplier
	PRIMARY KEY NONCLUSTERED (BookID, SupplierID)

ALTER TABLE Purchasing.BookSupplier
	ADD CONSTRAINT fk_bookSupplier_bookID
	FOREIGN KEY (bookID) REFERENCES Purchasing.Book(BookID)

ALTER TABLE Purchasing.BookSupplier
	ADD CONSTRAINT fk_bookSupplier_supplierID
	FOREIGN KEY (SupplierID) REFERENCES Purchasing.Supplier(SupplierID)

GO

PRINT 'END CONSTRAINTS FOR TABLE Purchasing.BookSupplier'
PRINT ''

GO

------------------------------------------
--INITIAL INSERTS
------------------------------------------

INSERT INTO Purchasing.BookSupplier VALUES (1, 1, '03-JAN-1999', '07-SEP-2003',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.BookSupplier VALUES  (1, 2, '09-OCT-1999', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.BookSupplier VALUES  (2, 2, '10-OCT-1999', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.BookSupplier VALUES  (3, 3, '07-APR-2000', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.BookSupplier VALUES  (4, 2, '10-OCT-1999', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.BookSupplier VALUES  (5, 1, '10-OCT-1999', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.BookSupplier VALUES  (6, 2, '09-OCT-1999', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.BookSupplier VALUES  (7, 1, '15-NOV-1999', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.BookSupplier VALUES  (7, 2, '23-NOV-1999', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.BookSupplier VALUES  (8, 2, '10-OCT-1999', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.BookSupplier VALUES  (9, 2, '10-OCT-1999', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.BookSupplier VALUES  (10, 1, '10-OCT-1999', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.BookSupplier VALUES  (11, 2, '10-OCT-1999', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.BookSupplier VALUES  (12, 2, '10-OCT-1999', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.BookSupplier VALUES  (13, 1, '03-JAN-1999', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.BookSupplier VALUES  (14, 3, '07-APR-2000', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())
INSERT INTO Purchasing.BookSupplier VALUES  (15, 3, '07-APR-2000', '31-DEC-2099',
	getDate(), SUSER_NAME(), getDate(), SUSER_NAME())

------------------------------------------
--CREATE TABLE OBJECT
------------------------------------------

CREATE TABLE Purchasing.NumberOfBooksSuppliedBySupplier (
SupplierID		INTEGER			NOT NULL,
SupplierName	VARCHAR(100)	NOT NULL,
NumberOfBooks	INTEGER			NOT NULL
)

GO

------------------------------------------
--CREATE TABLE OBJECT
------------------------------------------

CREATE TABLE Demo.SetOne (
animal		VARCHAR(20) NOT NULL
)

GO

INSERT INTO Demo.SetOne VALUES ('Tiger')
INSERT INTO Demo.SetOne VALUES ('Lion')
INSERT INTO Demo.SetOne VALUES ('Bear')
INSERT INTO Demo.SetOne VALUES ('Snake')
INSERT INTO Demo.SetOne VALUES ('Dog')

GO

CREATE TABLE Demo.SetTwo (
animal		VARCHAR(20) NOT NULL
)

INSERT INTO Demo.SetTwo VALUES ('Tiger')
INSERT INTO Demo.SetTwo VALUES ('Lion')
INSERT INTO Demo.SetTwo VALUES ('Chicken')
INSERT INTO Demo.SetTwo VALUES ('Snake')
INSERT INTO Demo.SetTwo VALUES ('Cat')

GO