/********************************************************************
DEMO 2.6.1

BASIC ORDER BY
********************************************************************/

--ADVENTURE WORKS EXTRA QUESTIONS 

https://learn.microsoft.com/en-us/sql/t-sql/queries/select-order-by-clause-transact-sql?view=sql-server-ver17


SELECT	[FirstName],
		[LastName],
		[Title],
		[Salary],
		[HireDate]
FROM	[HumanResources].[Employee]
ORDER
BY		[HireDate]

SELECT	[FirstName],
		[LastName],
		[Title],
		[Salary],
		[HireDate]
FROM	[HumanResources].[Employee]
ORDER
BY		[HireDate] ASC

SELECT	[FirstName],
		[LastName],
		[Title],
		[Salary],
		[HireDate]
FROM	[HumanResources].[Employee]
ORDER
BY		[HireDate] DESC


SELECT	[FirstName],
		[LastName],
		[Title],
		[Salary] AS [YearlyPay],
		[HireDate] AS [HiredOn]
FROM	[HumanResources].[Employee]
ORDER
BY		[YearlyPay] DESC,
		[HiredOn] DESC

SELECT	[FirstName],
		[LastName],
		[Title],
		[Salary],
		[HireDate]
FROM	[HumanResources].[Employee]
ORDER
BY		5 DESC,
		4 DESC

SELECT	[FirstName] AS FN,
		[LastName] AS LN,
		[Title],
		[Salary],
		[HireDate]
FROM	[HumanResources].[Employee]
ORDER
BY		LN DESC,
		FN DESC

--THE TWO NULL VALUES SHOW UP FIRST
SELECT	[FirstName],
		[LastName],
		[Title],
		[Salary],
		[HireDate]
FROM	[HumanResources].[Employee]
ORDER
BY		[Salary]


/********************************************************************
DEMO 2.6.2

TOP
********************************************************************/

https://learn.microsoft.com/en-us/sql/t-sql/queries/top-transact-sql?view=sql-server-ver17


SELECT	TOP 6
		[FirstName],
		[LastName],
		[Title],
		[Salary] AS [YearlyPay],
		[HireDate] AS [HiredOn]
FROM	[HumanResources].[Employee]


SELECT	TOP 6
		[FirstName],
		[LastName],
		[Title],
		[Salary] AS [YearlyPay],
		[HireDate] AS [HiredOn]
FROM	[HumanResources].[Employee]
ORDER
BY		[YearlyPay] DESC


SELECT	TOP 25 PERCENT
		[FirstName],
		[LastName],
		[Title],
		[Salary] AS [YearlyPay],
		[HireDate] AS [HiredOn]
FROM	[HumanResources].[Employee]
ORDER
BY		[YearlyPay] DESC


SELECT	TOP 25 PERCENT WITH TIES
		[FirstName],
		[LastName],
		[Title],
		[Salary] AS [YearlyPay],
		[HireDate] AS [HiredOn]
FROM	[HumanResources].[Employee]
ORDER
BY		[YearlyPay] DESC

/********************************************************************
DEMO 2.6.3

OFFSET AND FETCH
********************************************************************/

--ADVENTURE WORKS EXTRA QUESTIONS 

https://learn.microsoft.com/en-us/sql/t-sql/queries/select-order-by-clause-transact-sql?view=sql-server-ver17


SELECT	[FirstName],
		[LastName],
		[Title],
		[Salary],
		[HireDate]
FROM	[HumanResources].[Employee]
ORDER
BY		[HireDate]
OFFSET	5 ROWS


SELECT	[FirstName],
		[LastName],
		[Title],
		[Salary],
		[HireDate]
FROM	[HumanResources].[Employee]
ORDER
BY		[HireDate] 
OFFSET	5 ROWS
FETCH NEXT 2 ROWS ONLY;