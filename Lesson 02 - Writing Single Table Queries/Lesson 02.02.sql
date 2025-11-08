
/********************************************************************
DEMO 2.2.1

Question:
I want a list of city, province, and countries that our 
customer live in.
********************************************************************/

USE BookSellers;
GO

SELECT	[City], [ProvinceID], [CountryID]
FROM	[Sales].[Customer]


--NOTE: YOU WILL GET 7 ROWS BACK IN THE NEW SCHEMA
/*
City	ProvinceID	CountryID
Calgary		1	CA
Calgary		1	CA
Vancouver	2	CA
Boulder		19	US
Burnaby		2	CA
Burnaby		2	CA
Denver		19	US
*/








/********************************************************************
DEMO 2.2.2

Do I always need the FROM clause? 

********************************************************************/

SELECT 1, 'Hello'

















/********************************************************************
DEMO 2.2.3

Demo the use of arethmtic operators

********************************************************************/

SELECT	TOP 10 *
FROM	[Sales].[OrderDetail]


SELECT	[OrderHeaderID],
		[Quantity],
		[UnitPrice],
		[Quantity] * [UnitPrice]
FROM	[Sales].[OrderDetail]


SELECT	[OrderHeaderID],
		[Quantity],
		[UnitPrice],
		[Quantity] * [UnitPrice] AS LineTotal
FROM	[Sales].[OrderDetail]



--ORDER OF OPERATIONS
SELECT	1 + 2 * 3 AS PrecidenceRules


--ORDER OF OPERATIONS
SELECT	(1 + 2) * 3 PrecidenceRulesOverriden


--INTEGER / INTEGER -> INTEGER DIVISION RULES -> 0 
--(COMPONENT TO LEFT OF DECIMAL OR "INTEGER" PORTION)
SELECT	1/2
SELECT	3/2


--INTEGER / INTEGER -> INTEGER DIVISION RULES -> 1 
--(REMAINDER PORTION)
SELECT	1%3


--DECIMAL DIVISION WILL PRODUCE THE DECIMAL RESULT
SELECT	1.5/3.0
SELECT	1/2.0
SELECT	1.0/2










/********************************************************************
DEMO 2.2.4

Question:
I want a DISTINCT list of city, province, and countries that our 
customer live in.
********************************************************************/

USE BookSellers;
GO

SELECT	[City], [ProvinceID], [CountryID]
FROM	[Sales].[Customer]

--NOTE: YOU WILL GET 7 ROWS BACK IN THE NEW SCHEMA

SELECT	ALL [City], [ProvinceID], [CountryID]
FROM	[Sales].[Customer]

--NOTE: YOU WILL GET 7 ROWS BACK IN THE NEW SCHEMA

SELECT	DISTINCT [City], [ProvinceID], [CountryID]
FROM	[Sales].[Customer]

--NOTE: YOU WILL GET 5 ROWS BACK IN THE NEW SCHEMA. Denver was a late add