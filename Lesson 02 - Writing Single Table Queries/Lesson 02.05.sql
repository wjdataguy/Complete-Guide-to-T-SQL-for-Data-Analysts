/********************************************************************
DEMO 2.5.1

Multiple comparisons
********************************************************************/

--DEMO DATA SET
SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]


--EXAMPLE 1 - AND TRUTH TABLE
SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary > 50000
AND		Title = 'SALES'


--EXAMPLE 2 - OR TRUTH TABLE
SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary > 50000
OR		Title = 'SALES MANAGER'


--EXAMPLE 3 - MULTIPLE TRUTH TABLES (ORDER OF OPERATIONS)
SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary > 50000
AND		Title = 'SALES MANAGER' OR TITLE = 'SALES'


--EXAMPLE 4 - MULTIPLE TRUTH TABLES (ORDER OF OPERATIONS)
SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary > 50000
AND		(Title = 'SALES MANAGER' OR TITLE = 'SALES')


--EXAMPLE 5 - MULTIPLE TRUTH TABLES (ORDER OF OPERATIONS)
SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary > 50000 OR Salary IS NULL
AND		(Title = 'SALES MANAGER' OR TITLE = 'SALES')


--EXAMPLE 6 - MULTIPLE TRUTH TABLES (ORDER OF OPERATIONS)
SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	(Salary > 50000 OR Salary IS NULL)
AND		(Title = 'SALES MANAGER' OR TITLE = 'SALES')


SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	(Salary > 50000 OR Salary IS NULL)
AND		(Title IN ('SALES MANAGER', 'SALES'))

/********************************************************************
DEMO 2.5.2

BETWEEN
********************************************************************/

https://learn.microsoft.com/en-us/sql/t-sql/language-elements/between-transact-sql?view=sql-server-ver17

--LOGIC YOU MAY USE IF YOU DO NOT KNOW ABOUT THE BETWEEN CLAUSE
SELECT	[BookID], [BookTitle], [UnitPrice]
FROM	[Purchasing].[Book]
WHERE	UnitPrice <= 72.99 AND UnitPrice >= 52.99


--INCORRECT ORDER
SELECT	[BookID], [BookTitle], [UnitPrice]
FROM	[Purchasing].[Book]
WHERE	UnitPrice BETWEEN 72.99 AND 52.99


--CORRECT ORDER - BOUNDARIES INCLUDED
SELECT	[BookID], [BookTitle], [UnitPrice]
FROM	[Purchasing].[Book]
WHERE	UnitPrice BETWEEN 52.99 AND 72.99


--EXCLUSIVE RANGE - ORDER DOES NOT MATTER
SELECT	[BookID], [BookTitle], [UnitPrice]
FROM	[Purchasing].[Book]
WHERE	UnitPrice < 72.99 AND UnitPrice > 52.99


SELECT	[BookID], [BookTitle], [UnitPrice]
FROM	[Purchasing].[Book]
WHERE	UnitPrice > 52.99 AND UnitPrice < 72.99 

/********************************************************************
DEMO 2.5.3

IN CLAUSE
********************************************************************/

https://learn.microsoft.com/en-us/sql/t-sql/language-elements/in-transact-sql?view=sql-server-ver17

 
SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	LastName = 'Watson'
OR		LastName = 'Kruger'
OR		LastName = 'Puddyland'


SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	LastName IN ('Watson', 'Kruger', 'Puddyland')


SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary IN (100000, 35000, NULL)


SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary IN (100000, 35000)
OR		SALARY IS NULL

GO

/********************************************************************
DEMO 2.5.4

LIKE
********************************************************************/


https://learn.microsoft.com/en-us/sql/t-sql/language-elements/like-transact-sql?view=sql-server-ver17


SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	LastName LIKE 'W%'

SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	LastName NOT LIKE 'W%'

SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Title LIKE 'MARKETING%'

SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Title LIKE '%MARKETING%'

SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	FirstName LIKE '_im'

SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	FirstName LIKE '__im'


SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	FirstName LIKE '[k-z]im'

SELECT	FirstName, 
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	FirstName LIKE '[^k-z]im'

