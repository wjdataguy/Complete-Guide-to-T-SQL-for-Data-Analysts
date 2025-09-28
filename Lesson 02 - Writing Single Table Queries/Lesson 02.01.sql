
/********************************************************************
DEMO 2.1.1

Question:
How many sales orders have been shipped by order date
where there was more than 1 order?

Characteristics to highlight
1. Single table
2. Selection
3. Projection
********************************************************************/
USE BookSellers;
GO

SELECT	[FirstName], [LastName]	--PROJECTION
FROM	[HumanResources].[Employee]
WHERE	[FirstName] = 'Joey' --SELECTION







/********************************************************************
DEMO 2.1.2

Question:
How many sales orders have been shipped by order date
where there was more than 1 order

Characteristics to highlight
1. Single Table more compexity
2. Walk through the statement
********************************************************************/
USE BookSellers;
GO

SELECT	[CustomerID], COUNT([CustomerID]) AS OrderCount
FROM	Sales.OrderHeader
WHERE	ShippedDate IS NOT NULL --SHIPPED
GROUP 
BY		[CustomerID]
HAVING	COUNT([CustomerID]) > 1 --HAVE TO USE THE AGGREGATE FUNCTION
ORDER
BY		[CustomerID] DESC;


/********************************************************************
DEMO 2.1.3

Question:
Show the styling rules for the course
********************************************************************/

SELECT	[CustomerID], COUNT([CustomerID]) AS OrderCount
FROM	Sales.OrderHeader
WHERE	ShippedDate IS NOT NULL --SHIPPED
GROUP 
BY		[CustomerID]
HAVING	COUNT([CustomerID]) > 1 --HAVE TO USE THE AGGREGATE FUNCTION
ORDER
BY		[CustomerID] DESC;
