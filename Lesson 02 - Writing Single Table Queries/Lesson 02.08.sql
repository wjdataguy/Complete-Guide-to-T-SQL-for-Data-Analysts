
/********************************************************************
DEMO 2.8.1

SIMPLE AGGREGATIONS
********************************************************************/

SELECT	*
FROM	Purchasing.Category

SELECT	MAX(commissionRate) AS [MAX Commission Rate]
FROM	Purchasing.Category

SELECT	AVG(commissionRate) AS [AVG Commission Rate]
FROM	Purchasing.Category

SELECT	*
FROM	HumanResources.Employee

SELECT	AVG(Salary) AS [AVG Salary] --IGNORES THE NULL SALARIES
FROM	HumanResources.Employee

SELECT	COUNT(*) AS [COUNT Rows in Employee Table] 
FROM	HumanResources.Employee

SELECT	COUNT(employeeID) AS [COUNT Employee] --USING A NON-NULLBALE COLUMN
FROM	HumanResources.Employee

SELECT	COUNT(Salary) AS [COUNT Employee] --USING A NULLBALE COLUMN
FROM	HumanResources.Employee

SELECT	COUNT(LastName) AS [COUNT Employee] --USING A NULLBALE COLUMN
FROM	HumanResources.Employee

SELECT	COUNT(DISTINCT LastName) AS [COUNT Employee] --USING A NULLBALE COLUMN
FROM	HumanResources.Employee

/********************************************************************
DEMO 2.8.2

SUMMARIZING WITH GROUP BY
********************************************************************/

SELECT	CategoryID,
		AVG(unitCost) AS AverageCost
FROM	Purchasing.Book
GROUP 
BY		CategoryID

SELECT	CategoryID,
		MIN(unitCost) AS MinimumCost
FROM	Purchasing.Book
GROUP 
BY		CategoryID







/********************************************************************
DEMO 2.8.2

THE HAVING CLAUSE
********************************************************************/

SELECT	CategoryID,
		AVG(unitCost) AS AverageCost
FROM	Purchasing.Book
GROUP 
BY		CategoryID
HAVING	AVG(unitCost) > 30

