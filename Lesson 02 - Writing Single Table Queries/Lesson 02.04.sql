/********************************************************************
DEMO 2.4.1

Comparisons with NULLS
********************************************************************/


SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]


--INVALID
SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary = NULL


--VALID
SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary IS NULL


--INVALID
SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary <> NULL


--VALID
SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary IS NOT NULL


--TO SHOW THAT NULL is not the same as ''
SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary = ''


--TO SHOW THAT NULL is not zero
SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary = 0


/********************************************************************
Demo 3 - Multiple comparisons
********************************************************************/

SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]

SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary > 50000
AND		Title = 'SALES'


SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary > 50000
OR		Title = 'SALES MANAGER'


SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary > 50000
AND		Title = 'SALES MANAGER' OR TITLE = 'SALES'


SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary > 50000
AND		(Title = 'SALES MANAGER' OR TITLE = 'SALES')

--HOW DO WE GET GENE THAT IS NULL? tHSI IS WRONG AS IT GETS THE CEO
SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	Salary > 50000 OR Salary IS NULL
AND		(Title = 'SALES MANAGER' OR TITLE = 'SALES')


--HOW DO WE GET GENE THAT IS NULL? tHSI IS WRONG AS IT GETS THE CEO
SELECT	FirstName,
		LastName,
		Salary,
		Title
FROM	[HumanResources].[Employee]
WHERE	(Salary > 50000 OR Salary IS NULL)
AND		(Title = 'SALES MANAGER' OR TITLE = 'SALES')


/********************************************************************
Demo 4 - BETWEEN
********************************************************************/

https://learn.microsoft.com/en-us/sql/t-sql/language-elements/between-transact-sql?view=sql-server-ver17

--PLAY WITH THE BOUNADARIES HERE

SELECT	[BookID], [BookTitle], [UnitPrice]
FROM	[Purchasing].[Book]
WHERE	UnitPrice < 72.99 AND UnitPrice > 52.99

SELECT	[BookID], [BookTitle], [UnitPrice]
FROM	[Purchasing].[Book]
WHERE	UnitPrice BETWEEN 72.99 AND 52.99


SELECT	[BookID], [BookTitle], [UnitPrice]
FROM	[Purchasing].[Book]
WHERE	UnitPrice BETWEEN 52.99 AND 72.99


/********************************************************************
Demo 5 - IN
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

GO


/********************************************************************
Demo 6 - LIKE
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

/********************************************************************
Demo 5 - SOME ANY ALL EXISTS (renove from this section)
********************************************************************/

SELECT	BookTitle,
		UnitPrice
FROM	[Purchasing].[Book]
WHERE	UnitPrice < SOME (SELECT UnitPrice FROM [Purchasing].[Book] WHERE CategoryID = 5)
ORDER
BY		UnitPrice

SELECT	BookTitle,
		UnitPrice
FROM	[Purchasing].[Book]
WHERE	UnitPrice < ANY (SELECT UnitPrice FROM [Purchasing].[Book] WHERE CategoryID = 5)
ORDER
BY		UnitPrice

SELECT	BookTitle,
		UnitPrice
FROM	[Purchasing].[Book]
WHERE	UnitPrice < ALL (SELECT UnitPrice FROM [Purchasing].[Book] WHERE CategoryID = 5)
ORDER
BY		UnitPrice