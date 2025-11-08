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

