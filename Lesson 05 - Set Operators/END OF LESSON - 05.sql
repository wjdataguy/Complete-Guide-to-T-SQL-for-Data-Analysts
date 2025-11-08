-----------------------------------------------------------------------------
--Lesson 05 - SET OPERATORS
-----------------------------------------------------------------------------

/************************************************
1.	
PRODUCE A DISTINCT LIST OF ALL FIRST NAME AND
LAST NAMES ACROSS THE EMPLOYEE AND CUSTOMER TABLES
************************************************/

SELECT	[FirstName],
		[LastName]
FROM	[HumanResources].[Employee]
UNION
SELECT	[ContactFirstName],
		[ContactLastName]
FROM	[Sales].[Customer]


/************************************************
2.	
PRODUCE A FULL LIST OF ALL FIRST NAME AND
LAST NAMES ACROSS THE EMPLOYEE AND CUSTOMER TABLES
************************************************/

SELECT	[FirstName],
		[LastName]
FROM	[HumanResources].[Employee]
UNION ALL
SELECT	[ContactFirstName],
		[ContactLastName]
FROM	[Sales].[Customer]


/************************************************
3.	
PRODUCE A FULL LIST OF ALL FIRST NAME AND
LAST NAMES THAT ONLY APPEAR IN THE EMPLOYEE TABLE
************************************************/

SELECT	[FirstName],
		[LastName]
FROM	[HumanResources].[Employee]
EXCEPT
SELECT	[ContactFirstName],
		[ContactLastName]
FROM	[Sales].[Customer]


/************************************************
4.	
PRODUCE A FULL LIST OF ALL FIRST NAME AND
LAST NAMES THAT ARE COMMON TO BOTH THE EMPLOYEE 
TABLE AND CUSTOMER TABLE
************************************************/

SELECT	[FirstName],
		[LastName]
FROM	[HumanResources].[Employee]
INTERSECT
SELECT	[ContactFirstName],
		[ContactLastName]
FROM	[Sales].[Customer]

