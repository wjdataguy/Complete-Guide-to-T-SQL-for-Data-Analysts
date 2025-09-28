/**********************************************************

SCRIPT NAME: 
CREATED BY: CHRIS SORENSEN
CREATED DATE: 
DESCRITION: 

Modifications: 


***********************************************************/

--
/*
USE master
GO
*/

CREATE DATABASE TSQLConceptDemos

GO

-----------------------------------------------------------
--NOW THAT A DATABASE IS CREATED, WE NEED TO TELL THE
--SCRIPT ENGINE TO CREATE THE OBJECTS IN THAT DATABASE
--THAT IS WHAT "USE" DOES. IF YOU HIGHLIGHT AND RUN THIS
--YOU WILL NOTICE THE DROP DOWN BOX AT THE TOP OF THE
--SCEREEN CHANGE, IF IS IT IS A DIFFERENT DATABASE OF COURSE.
-----------------------------------------------------------

USE TSQLConceptDemos

GO

-----------------------------------------------------------
--WE WILL NEED THIS SETTING TURNED ON LATER IN THE CLASS
--SO LET IT RUN NOW AND I WILL EXPLAIN IT FURTHUR DURING
--THE CLASS. THIS LINE CAN ALSO BE COMMENTED OUT AFTER
--THE SCRIPT IS RUN FOR THE FIRST TIME.
-------------------------------------------------------------
ALTER DATABASE TSQLConceptDemos SET RECOVERY BULK_LOGGED
ALTER DATABASE TSQLConceptDemos SET RECOVERY FULL

GO

-----------------------------------------------------------
--This setting stops the message indicating the number of 
--rows affected by a Transact-SQL statement from being 
--returned as part of the results.
-----------------------------------------------------------
SET NOCOUNT ON

GO

CREATE SCHEMA [DemoSets] AUTHORIZATION [dbo];
GO

------------------------------------------
--CREATE TABLE OBJECT
------------------------------------------

--DROP TABLE DemoSets.Products
/*
PRINT 'START CREATE TABLE DemoSets.Products'

GO

CREATE TABLE DemoSets.Products (
ProductName		VARCHAR(100),
Color			VARCHAR(100)
)

GO

PRINT 'END CREATE TABLE DemoSets.Products'

GO

INSERT INTO DemoSets.Products VALUES ('A', 'Blue')
INSERT INTO DemoSets.Products VALUES ('A', NULL)
INSERT INTO DemoSets.Products VALUES ('B', 'Orange')
INSERT INTO DemoSets.Products VALUES ('C', 'Purple')


GO
------------------------------------------
--CREATE TABLE OBJECT
------------------------------------------

--DROP TABLE DemoSets.DiscontinuedProducts
--TRUNCTAE TABLE DemoSets.DiscontinuedProducts

PRINT 'START CREATE TABLE DemoSets.DiscontinuedProducts'

GO

CREATE TABLE DemoSets.DiscontinuedProducts (
ProductName			VARCHAR(100),
Color				VARCHAR(100),
DiscontinuedDate	DATE
)

GO

PRINT 'END CREATE TABLE DemoSets.DiscontinuedProducts'

GO

INSERT INTO DemoSets.DiscontinuedProducts VALUES ('A', NULL, '01-JAN-2025')
INSERT INTO DemoSets.DiscontinuedProducts VALUES ('C', 'Purple', '20-JAN-2025')
INSERT INTO DemoSets.DiscontinuedProducts VALUES ('C', NULL, '01-FEB-2025')
INSERT INTO DemoSets.DiscontinuedProducts VALUES ('D', 'Black', '25-MAR-2025')
INSERT INTO DemoSets.DiscontinuedProducts VALUES ('E', 'Black', '17-APR-2025')

GO
*/

------------------------------------------
--CREATE TABLE OBJECT
------------------------------------------

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'MyAnimals' AND SCHEMA_NAME(schema_id) = 'DemoSets')
BEGIN
    DROP TABLE DemoSets.MyAnimals
    PRINT 'DROP TABLE DemoSets.MyAnimals';
END;

CREATE TABLE DemoSets.MyAnimals (
MyAnimal		VARCHAR(20),
MyColor			VARCHAR(20),
MyAge			INTEGER,
MyGivenName		VARCHAR(20),
MyBirthDate     DATE
)

GO

INSERT INTO DemoSets.MyAnimals VALUES ('Tiger', 'Yellow', 10, 'Leo', '01-JAN-2015')
INSERT INTO DemoSets.MyAnimals VALUES ('Lion', NULL, 11, 'Lexi', '01-APR-2014')
INSERT INTO DemoSets.MyAnimals VALUES ('Bear', 'Brown', 10, 'Boo', '01-JAN-2015')
INSERT INTO DemoSets.MyAnimals VALUES ('Snake', 'Green', 3, 'Sly', '01-MAY-2022')
INSERT INTO DemoSets.MyAnimals VALUES ('Dog', 'Black', 5, 'Leo', '01-DEC-2020')
INSERT INTO DemoSets.MyAnimals VALUES ('Bird', NULL, 5, 'Chirpy', '01-NOV-2020')
INSERT INTO DemoSets.MyAnimals VALUES ('Bird', 'NULL', 5, 'Chirpy', '01-DEC-2020')

GO

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'YourAnimals' AND SCHEMA_NAME(schema_id) = 'DemoSets')
BEGIN
    DROP TABLE DemoSets.YourAnimals
    PRINT 'DROP TABLE DemoSets.YourAnimals';
END;

CREATE TABLE DemoSets.YourAnimals (
YourAnimal		VARCHAR(20),
YourAge			INTEGER,
YourColor		VARCHAR(20),
YourBirthDate     DATE,
YourGivenName	VARCHAR(20)
)

INSERT INTO DemoSets.YourAnimals VALUES ('Tiger', 11, 'White', '01-JAN-2014', 'Bob')
INSERT INTO DemoSets.YourAnimals VALUES ('Lion', 12, NULL, '01-FEB-2013', 'Sasha')
INSERT INTO DemoSets.YourAnimals VALUES ('Chicken', 10, 'Red', '01-MAR-2015', 'Yuji')
INSERT INTO DemoSets.YourAnimals VALUES ('Snake', 3, 'Green', '01-JAN-2022', 'Saj')
INSERT INTO DemoSets.YourAnimals VALUES ('Cat', 9, 'Black', '01-SEP-2016', 'Grumpy')
INSERT INTO DemoSets.YourAnimals VALUES ('Dog', 5, 'Black', '01-DEC-2020', 'Leo')

GO

