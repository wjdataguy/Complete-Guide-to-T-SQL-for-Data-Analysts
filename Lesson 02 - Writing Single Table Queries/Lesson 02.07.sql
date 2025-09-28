/********************************************************************
DEMO 2.7.1

Conversion Functions
********************************************************************/


SELECT	*
FROM 	HumanResources.Employee

--Use CAST to concatenate
SELECT	'The ID for : ' + 
		LastName + ' is ' +
		employeeID AS 'ID List'
FROM 	HumanResources.Employee

--Use CAST to concatenate
SELECT	'The ID for : ' + 
		LastName + ' is ' +
		CAST(employeeID AS varchar(10)) AS 'ID List'
FROM 	HumanResources.Employee

--EXPLICIT CONVERSION
SELECT	CAST('1' AS INTEGER) + 2 AS TheOutput

--IMPLICIT CONVERSION
SELECT	'1' + 2 AS TheOutput


--These examples retrieve the name of the product, for those products 
--that have a 3 as the first digit of list price, and converts their 
--ListPrice values to char
SELECT	BookTitle,
		UnitPrice
FROM	[Purchasing].[Book]
WHERE	CAST(UnitPrice AS varchar) LIKE '3%';


SELECT	BookTitle,
		UnitPrice
FROM	[Purchasing].[Book]
WHERE	UnitPrice LIKE '3%';


SELECT	BookTitle,
		UnitPrice
FROM	[Purchasing].[Book]
WHERE	CONVERT(varchar, UnitPrice) LIKE '3%';


--USING CAST AND CONVERT
--These functions convert an expression of one data type to another.
SELECT	GETDATE() AS UnconvertedDateTime,
		CAST(GETDATE() AS NVARCHAR(30)) AS UsingCast,
		CONVERT(NVARCHAR(30), GETDATE(), 112) AS UsingConvertTo_ISO;
GO


--Returns a value cast to the specified data type if the cast succeeds; otherwise, returns null.
SELECT	CASE WHEN TRY_CAST('test' AS FLOAT) IS NULL
		THEN 'Cast failed'
		ELSE 'Cast succeeded'
		END AS Result;
GO

/********************************************************************
DEMO 2.7.2

Date and time functions
********************************************************************/

SELECT	FirstName,
		LastName,
		HireDate,
		BirthDate
FROM	[HumanResources].[Employee]


SELECT	FirstName,
		LastName,
		HireDate,
		YEAR(HireDate) AS HireYear,
		BirthDate,
		MONTH(BirthDate) AS BirthMonth,
		DATEDIFF(YEAR, BirthDate, HireDate) AS AgeOnHireDate,
		YEAR(DATEADD(YEAR, 5, HireDate)) YearOfFifthWorkAnniversary 
FROM	[HumanResources].[Employee]


SELECT	SYSDATETIME(),
		SYSDATETIMEOFFSET(),
		SYSUTCDATETIME(),
		CURRENT_TIMESTAMP,
		GETDATE(),
		GETUTCDATE()
		--,CURRENT_DATE; --Applies to:  Azure SQL Database  Azure SQL Managed Instance

/********************************************************************
DEMO 2.7.3

Logical Functions
********************************************************************/

--CHOOSE Returns the item at the specified index from a list of values in SQL Server.
SELECT	BookTitle,
		CategoryID,
		CHOOSE (CategoryID, 'One','Two','Three','Four') AS Expression1
FROM	[Purchasing].[Book]


SELECT	FirstName,
		LastName,
		HireDate,
		BirthDate,
		CHOOSE(MONTH(BirthDate),'Winter','Winter', 'Spring','Spring','Spring','Summer','Summer',   
                          'Summer','Autumn','Autumn','Autumn','Winter') AS BirthSeason
FROM	[HumanResources].[Employee]


/********************************************************************
DEMO 2.7.4

Mathematical functions
********************************************************************/


--ROUND Returns a numeric value, rounded to the specified length or precision.
SELECT	ROUND(123.9994, 3),
		ROUND(123.9995, 3)

--FLOOR Returns the largest integer less than or equal to the specified numeric expression.
SELECT	FLOOR(123.55) AS FloorPositive, 
		FLOOR(-123.55) AS FloorNegative,
		FLOOR($123.55) AS FloorPositiveCurrency, ---WHY ARE THESE HERE?
		FLOOR(-$123.55) AS FloorNegativeCurrency

--CEILING This function returns the smallest integer greater than, or equal to, the specified numeric expression
SELECT	CEILING(123.45) AS CeilingPositive, 
		CEILING(-123.45) AS CeilingNegative,
		CEILING($123.45) AS CeilingPositiveCurrency,
		CEILING(-$123.45) AS CeilingNegativeCurrency

/********************************************************************
DEMO 2.7.5

String Functions
********************************************************************/


SELECT	FirstName,
		LEN(FirstName) AS [LEN FirstName],
		LEFT(FirstName, 2) AS [LEFT FirstName],
		RIGHT(FirstName, 2) AS [RIGHT FirstName],
		SUBSTRING(FirstName, 2, 2) AS [SUBSTRING FirstName],
		UPPER(FirstName) AS [UPPER FirstName],
		LOWER(FirstName) AS [LOWER FirstName],
		REPLACE(FirstName, 'im', 'immy')
FROM	[HumanResources].[Employee]

--LTRIM Removes space character char(32) or other specified characters from the start of a string.
--RTRIM Removes space character char(32) or other specified characters from the end of a string.
--TRIM Removes the space character char(32) or other specified characters from the start and end of a string.

/********************************************************************
DEMO 2.7.6

Functions for replacing NULL
********************************************************************/

SELECT	customerName, 
		email,
		phone
FROM	Sales.Customer


SELECT	customerName, 
		ISNULL(email, 'No email on file') AS email,
		phone
FROM	Sales.Customer

SELECT	customerName, 
		email,
		phone
FROM	Sales.Customer

SELECT	customerName,
		email,
		phone,
		COALESCE (email, phone, 'Unknown Contact Method') AS ContactMethod
FROM	Sales.Customer

/********************************************************************
DEMO 2.7.7

Simple Case Function
********************************************************************/

SELECT	*
FROM	Sales.OrderHeader

SELECT	orderHeaderID,
		CASE orderHeaderID % 2
			WHEN 0 THEN 'Even # Order'
			WHEN 1 THEN 'Odd # Order'
		END AS 'Odd or Even?'
FROM	Sales.OrderHeader

/********************************************************************
DEMO 2.7.8

Searched Case Function
********************************************************************/

SELECT	employeeID,
		FirstName,
		LastName,
		hireDate,
		CASE	
			WHEN YEAR(hireDate) BETWEEN 1900 AND 1999 THEN '20th Century'
			WHEN YEAR(hireDate) BETWEEN 2000 AND 2099 THEN '21th Century'
			ELSE 'BEFORE 1900 WOW!!!'
		END AS centuryHired
FROM	HumanResources.Employee
