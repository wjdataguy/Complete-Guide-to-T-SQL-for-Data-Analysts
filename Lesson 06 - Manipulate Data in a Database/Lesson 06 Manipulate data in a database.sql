
/********************************************************************
DEMO 6.1.1

INSERT VALUES
********************************************************************/

/********************************************************************
DEMO 1A
********************************************************************/

USE BookSellers
GO

SELECT	*
FROM	Sales.Customer

INSERT INTO Sales.Customer VALUES 
	(8, 'The Trendy Bookstore', 'Michael', 
	'Schwab', 3, '67 Barlow Trail', 
	'T5H-7U7', 'Calgary', 1, 
	'CA', '(403) 245-7283', 'george@ttb.com', 
	'A', getDate(), 'csorensen', 
	getDate(), 'csorensen')










/********************************************************************
DEMO 1B
********************************************************************/

SELECT	*
FROM	Sales.Customer

INSERT INTO Sales.Customer 
	(customerID, customerName, CustomerStatus,
	addedDate, addedBy, modifiedDate, 
	modifiedBy)
VALUES 
	(9, 'Indigo', 'I',
	getDate(), 'csorensen', getDate(), 
	'csorensen'),
	(10, 'Indigo', 'I',
	getDate(), 'csorensen', getDate(), 
	'csorensen')

--CAN ALSO HAVE 2 VALUE CLAUSES

SELECT	*
FROM	Sales.Customer
WHERE	CustomerID IN (9,10)

DELETE
FROM	Sales.Customer
WHERE	CustomerID IN (9,10)

/********************************************************************
DEMO 6.1.2

INSERT SELECT
********************************************************************/

SELECT	*
FROM	[Purchasing].[NumberOfBooksSuppliedBySupplier]

TRUNCATE TABLE [Purchasing].[NumberOfBooksSuppliedBySupplier]
GO

--this is a good exmaple to build the MERGE statement on
INSERT INTO [Purchasing].[NumberOfBooksSuppliedBySupplier]
SELECT	s.supplierID, 
		s.supplierName, 
		COUNT(bs.supplierID) AS TheCount
FROM	[Purchasing].[Supplier] s
LEFT JOIN [Purchasing].[BookSupplier] bs
ON		s.supplierID = bs.SupplierID
GROUP
BY		s.supplierID, 
		s.supplierName

/********************************************************************
DEMO 6.1.3

SELECT INTO
********************************************************************/

SELECT	*
FROM	[Purchasing].[NumberOfBooksSuppliedBySupplierViaINTO]

SELECT	s.supplierID, 
		s.supplierName, 
		COUNT(bs.supplierID) AS TheCount
INTO	[Purchasing].[NumberOfBooksSuppliedBySupplierViaINTO]
FROM	[Purchasing].[Supplier] s
LEFT JOIN [Purchasing].[BookSupplier] bs
ON		s.supplierID = bs.SupplierID
GROUP
BY		s.supplierID, 
		s.supplierName

/********************************************************************
DEMO 6.2.1

UPDATE SIMPLE
********************************************************************/

SELECT	*
FROM	[Purchasing].[NumberOfBooksSuppliedBySupplier] s
WHERE	SupplierID = 1

UPDATE	[Purchasing].[NumberOfBooksSuppliedBySupplier]
SET		supplierName = UPPER(supplierName) 


UPDATE	[Purchasing].[NumberOfBooksSuppliedBySupplier]
SET		supplierName = 'MC NALLEE'
WHERE	SupplierID = 1








/********************************************************************
DEMO 6.2.2

UPDATE MORE COMPLEX
********************************************************************/

UPDATE	s
SET		s.numberOfBooks = bs.numberOfBooks
FROM	Purchasing.Supplier s 
JOIN	[Purchasing].[NumberOfBooksSuppliedBySupplier] bs
ON		s.supplierID = bs.supplierID

SELECT	*	
FROM	Purchasing.Supplier s 
JOIN	[Purchasing].[NumberOfBooksSuppliedBySupplier] bs
ON		s.supplierID = bs.supplierID

SELECT	*
FROM	Purchasing.Supplier





/********************************************************************
DEMO 6.2.3

UPDATE BASED ON A SUBQUERY
********************************************************************/


UPDATE	[HumanResources].[Employee]
SET		Salary = Salary + 500
WHERE	EmployeeID IN 
( 
	SELECT	e.employeeID
	FROM	[HumanResources].[Employee] e
	WHERE	EXISTS (SELECT	c.EmployeeID
					FROM	[Sales].[Customer] c
					WHERE	c.EmployeeID = e.EmployeeID)
)

SELECT	*
FROM	[HumanResources].[Employee]





/********************************************************************
DEMO 6.3.1

DELETE STATEMENT
********************************************************************/

SELECT	*
FROM	[Purchasing].[NumberOfBooksSuppliedBySupplier]

DELETE
FROM	[Purchasing].[NumberOfBooksSuppliedBySupplier]
WHERE	NumberOfBooks < 1

DELETE
FROM	[MasterData].[Province]
WHERE	[ProvinceID] = 1

SELECT	*
FROM	[MasterData].[Province]





/********************************************************************
DEMO 6.4.1

TRUNCATE STATEMENT
********************************************************************/

SELECT	*
FROM	[Purchasing].[NumberOfBooksSuppliedBySupplier]

TRUNCATE TABLE [Purchasing].[NumberOfBooksSuppliedBySupplier]

DROP TABLE [Purchasing].[NumberOfBooksSuppliedBySupplier]



