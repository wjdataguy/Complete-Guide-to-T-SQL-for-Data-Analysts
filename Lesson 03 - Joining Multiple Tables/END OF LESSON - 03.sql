
-----------------------------------------------------------------------------
--Lesson 03 - Joining Multiple Tables
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
--1.Get all of our customers names, order id and their orders dates. Format 
--the date using DD MON YYYY. For bonus marks place a dash in the blank 
--spots so that the format is now DD-MON-YYYY

--char(32) equates to a blank space. You may have also done this ' ' to
--simulate a blank space
SELECT	a.customerName,
		b.orderHeaderID,
		convert(VARCHAR(11), b.orderDate, 106),
		replace(convert(VARCHAR(11), b.orderDate, 106), ' ', '-') AS orderDate
FROM	[Sales].[Customer] a JOIN [Sales].[OrderHeader] b
                         ON a.customerID = b.customerID

--RUN THIS STATEMENT, IT LETS YOU KNOW THE ASCII CODE FOR A BLANK
--I THEN USE THAT CODE TO PUT IN THE CHAR FUNCTION
SELECT	ascii(' ')
SELECT '7' + char(32) + '7'

-----------------------------------------------------------------------------
--2.Restrict Question #1 to include orders that occurred in September of 
--any year

SELECT	a.customerName,
	    b.orderHeaderID,
	    replace(convert(VARCHAR(11), b.orderDate, 106), char(32), '-') AS orderDate
FROM	[Sales].[Customer] a JOIN [Sales].[OrderHeader] b
                         ON a.customerID = b.customerID
WHERE	month(b.orderDate) = 9

-----------------------------------------------------------------------------
--3.Using a join, get all suppliers names, city and province name that 
--are from Alberta

SELECT	a.supplierName,
	    a.city,
	    b.provinceName
FROM	[Purchasing].[Supplier] a JOIN [MasterData].[Province] b
                         ON a.provinceID = b.provinceID
WHERE 	provinceName = 'ALBERTA'

-----------------------------------------------------------------------------
--4.Get the total number of books that each employee has sold for employees 
--that have sold books

SELECT	a.FirstName,
		a.LastName,
		sum(d.quantity) AS [Number of Books Sold]
FROM	[HumanResources].[Employee] a 
                       JOIN [Sales].[Customer] b
                         ON a.employeeID = b.employeeID
                       JOIN [Sales].[OrderHeader] c
                         ON b.customerID = c.customerID
                       JOIN [Sales].[OrderDetail] d
                         ON c.orderHeaderID = d.orderHeaderID
GROUP
BY	    a.FirstName,
	    a.LastName

-----------------------------------------------------------------------------
--5.Get the total number of books that each employee has sold, including 
--employees that have sold none.  Ensure that the amount reads 0, for 
--those that have sold none.

SELECT	a.FirstName,
		a.LastName,
		--sum(d.quantity) [Number of Books Sold 1],
		sum(isNull(d.quantity, 0)) [Number of Books Sold 2]
FROM	[HumanResources].[Employee] a LEFT JOIN [Sales].[Customer] b
                              ON a.employeeID = b.employeeID
                       LEFT JOIN [Sales].[OrderHeader] c
                              ON b.customerID = c.customerID
                       LEFT JOIN [Sales].[OrderDetail] d
                              ON c.orderHeaderID = d.orderHeaderID
GROUP
BY	    a.FirstName,
	    a.LastName

-----------------------------------------------------------------------------


SELECT	a.FirstName,
	    a.LastName,
	    sum(isNull(d.quantity, 0)) [Number of Books Sold]
FROM	[HumanResources].[Employee] a 
                       LEFT JOIN [Sales].[Customer] b
                              ON a.employeeID = b.employeeID
                       LEFT JOIN [Sales].[OrderHeader] c
                              ON b.customerID = c.customerID
                       LEFT JOIN [Sales].[OrderDetail] d
                              ON c.orderHeaderID = d.orderHeaderID
GROUP
BY	    a.FirstName,
	    a.LastName

--BUILDING THE QUERY UP

--STEP ONE - GET YOUR JOINS WORKING
SELECT	*
FROM	[Sales].[OrderDetail] od JOIN [Sales].[OrderHeader] oh
                             ON od.orderHeaderID = oh.orderHeaderID
                           JOIN [Sales].[Customer] c
                             ON oh.customerID = c.customerID
                           JOIN [HumanResources].[Employee] e
                             ON c.employeeID = e.employeeID


--STEP TWO - DO WE HAVE ALL OF THE ROWS THAT WE NEED
SELECT	*
FROM	[Sales].[OrderDetail] od JOIN [Sales].[OrderHeader] oh
                             ON od.orderHeaderID = oh.orderHeaderID
                           JOIN [Sales].[Customer] c
                             ON oh.customerID = c.customerID
                           JOIN [HumanResources].[Employee] e
                             ON c.employeeID = e.employeeID

--STEP TWO - DO WE HAVE ALL OF THE ROWS THAT WE NEED
SELECT	e.FirstName,
	    e. LastName,
	    sum(isNull(od.quantity, 0)) [Number of Books Sold]
FROM	[Sales].[OrderDetail] od JOIN [Sales].[OrderHeader] oh
                             ON od.orderHeaderID = oh.orderHeaderID
                           JOIN [Sales].[Customer] c
                             ON oh.customerID = c.customerID
                     RIGHT JOIN [HumanResources].[Employee] e
                             ON c.employeeID = e.employeeID
GROUP
BY	    e.FirstName,
	    e.LastName
