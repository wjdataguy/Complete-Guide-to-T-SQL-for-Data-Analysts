-----------------------------------------------------------------------------
--Lesson 06 - Manipulate Data in a Database
-----------------------------------------------------------------------------

USE BookSellers
GO

/************************************************
1.	
Add a new employee. You choose the parameters. 
************************************************/

SELECT	*
FROM	[HumanResources].[Employee] 

INSERT INTO [HumanResources].[Employee] 
	VALUES (13, 'Dave', 'Smith', 'SALES', 200000, 
	'24-SEP-2003', '10-JUN-1975', 2, '89 Pepsi Center Way', '45898-91', 
	'Denver', 19, 'US', '(789) 354-8492', 'dsmith@wholesalebooks.com',
	getDate(), 'csorensen', getDate(), 'csorensen')

/************************************************
2.
Update the category Named Philosophy to 
Philosophy/Religious Studies 
************************************************/

UPDATE	[Purchasing].[Category]
SET		categoryName = 'Philosophy/Religious Studies'
WHERE	categoryID = 2

SELECT	*
FROM	[Purchasing].[Category]
WHERE	categoryID = 2

/************************************************
3.	
Increase the Cost of all books that have sold 
more than 20 copies by 25% 
************************************************/

--QUERY TO SEE WHAT BOOKS HAVE SOLD 20 (QUICK VISUAL)
SELECT	bookID, SUM(b.quantity)
FROM	[Sales].[OrderDetail] b
GROUP
BY		bookID
HAVING	SUM(b.quantity) > 20


UPDATE	[Purchasing].[Book]
SET		unitCost = unitCost * 1.25
WHERE	bookID IN (
	SELECT	bookID
	FROM	[Sales].[OrderDetail] b
	GROUP
	BY	bookID
	HAVING	SUM(b.quantity) > 20)

SELECT	*
FROM	[Purchasing].[Book]

/************************************************
4.	Delete all SALES people that do not 
represent a customer 
************************************************/
SELECT	*
FROM	[HumanResources].[Employee] a
WHERE	NOT EXISTS (SELECT b.EmployeeID
                    FROM   [Sales].[Customer] b
                    WHERE  b.EmployeeID = a.employeeID)
AND		a.title = 'SALES'

DELETE	e
FROM	[HumanResources].[Employee] e
WHERE	NOT EXISTS (SELECT b.EmployeeID
                    FROM   [Sales].[Customer] b
                    WHERE  b.EmployeeID = e.employeeID)
AND		e.title = 'SALES'
