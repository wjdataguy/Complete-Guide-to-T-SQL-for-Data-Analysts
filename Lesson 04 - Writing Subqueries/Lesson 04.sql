
/********************************************************************
DEMO 4.2.1

DEMO 1a – Self-contained Subqueries using Comparison Operators
Subquery cannot return more than 1 value (row)
Subquery runs first and once, and sends it result to the outer query
Select list in the inner query can only contain one column
********************************************************************/

SELECT	customerName
FROM	Sales.Customer
WHERE	employeeID = (SELECT employeeID --, FirstName
                      FROM	 HumanResources.Employee
                      WHERE  LastName = 'Kruger'
                      AND    FirstName = 'Cosmo')



--STEP 1 - THE INNER QUERY
SELECT  employeeID --,FirstName
FROM    HumanResources.Employee
WHERE   LastName = 'Kruger'
AND     FirstName = 'Cosmo'



--STEP 2 -- THE OUTER QUERY
SELECT	customerName
FROM	Sales.Customer
WHERE	employeeID = (5)



--ERROR MULTIPLE COLUMSN IN THE SUBQUERY
--Only one expression can be specified in the 
--select list when the subquery is not introduced with EXISTS.
SELECT	customerName
FROM	Sales.Customer
WHERE	employeeID = (SELECT employeeID ,FirstName
                      FROM	 HumanResources.Employee
                      WHERE  LastName = 'Kruger'
                      AND    FirstName = 'Cosmo')

--ERROR MULTIPLE ROW IN THE SUBQUERY
--Subquery returned more than 1 value. This is not permitted 
--when the subquery follows a comparison operator
SELECT	customerName
FROM	Sales.Customer
WHERE	employeeID = (SELECT EmployeeID
                      FROM	 HumanResources.Employee)


/********************************************************************
DEMO 1b – Self-contained Subqueries using Logical Operators
Subquery CAN return more than 1 value (row)
Subquery runs first and once, and sends it result to the outer query
Select list in the inner query can only contain one column
ANY/SOME - TRUE if any one of a set of comparisons are TRUE.
********************************************************************/

--STATE THE BUSINESS QUESTIONS
SELECT	*
FROM	HumanResources.Employee a 
WHERE	salary > ANY (SELECT b.salary
                      FROM   HumanResources.Employee b
                      WHERE  title = 'SALES'
                      AND    salary IS NOT NULL)

--(40000.00, 55000.00, 57500.00, 60000.00)
-- > ANY MEANS GREATER THAN THE LEAST IN THE SET

--STEP 1
SELECT b.salary
FROM   HumanResources.Employee b
WHERE  title = 'SALES'
AND    salary IS NOT NULL

--SETP 2 - RESULT (40000.00, 55000.00, 57500.00, 60000.00)

--STEP 3
SELECT	*
FROM	HumanResources.Employee a 
WHERE	salary > 40000

--SOME IS EQUIVALENT
SELECT	*
FROM	HumanResources.Employee a 
WHERE	salary > SOME (SELECT b.salary
                      FROM   HumanResources.Employee b
                      WHERE  title = 'SALES'
                      AND    salary IS NOT NULL)


/********************************************************************
DEMO 1c – Self-contained Subqueries using Logical Operators
Subquery CAN return more than 1 value (row)
Subquery runs first and once, and sends it result to the outer query
Select list in the inner query can only contain one column
ALL - TRUE if all of a set of comparisons are TRUE.
********************************************************************/

--STATE THE BUSINESS QUERSTIONS
SELECT	*
FROM	HumanResources.Employee a 
WHERE	salary > ALL (SELECT b.salary
                      FROM   HumanResources.Employee b
                      WHERE  title = 'SALES'
                      AND    salary IS NOT NULL)

--(40000.00, 55000.00, 57500.00, 60000.00)
-- > ALL MEANS GREATER THAN THE GREATEST VALUE IN THE SET

--STEP 1
SELECT b.salary
FROM   HumanResources.Employee b
WHERE  title = 'SALES'
AND    salary IS NOT NULL

--SETP 2 - RESULT (40000.00, 55000.00, 57500.00, 60000.00)

--STEP 3
SELECT	*
FROM	HumanResources.Employee a 
WHERE	salary > 60000

--THIS WILL GIVE AN UNEXPECTED RESULT
SELECT	*
FROM	HumanResources.Employee a 
WHERE	salary > ALL (SELECT b.salary
                      FROM   HumanResources.Employee b
                      WHERE  title = 'SALES')

--SETP 2 - RESULT (NULL, 40000.00, 55000.00, 57500.00, 60000.00)

/********************************************************************
DEMO 1d – Self-contained Subqueries using Logical Operators
Subquery CAN return more than 1 value (row)
Subquery runs first and once, and sends it result to the outer query
Select list in the inner query can only contain one column
IN - TRUE if the operand is equal to one of a list of expressions
********************************************************************/

--STATE THE BUSINESS QUESITON
SELECT	*
FROM	HumanResources.Employee a 
WHERE	a.ProvinceID IN (   SELECT p.ProvinceID
                            FROM   MasterData.Province p
                            WHERE  ProvinceName LIKE '%C%'
                            )
--step 1 - INNER QUERY
SELECT p.ProvinceID
FROM   MasterData.Province p
WHERE  ProvinceName LIKE '%C%'




/********************************************************************
DEMO 4.3.1

Corelated Subqueries using Comparison Operators
Subquery cannot return more than 1 value
********************************************************************/

--BUSINESS QUESITON
--GET THE LOWEST PRICE BOOK IN EACH CATEGORY
--EXPLAIN ON A SPREASHEET FIRST HOW THE PROCESSOR IS WORKING
SELECT  ob.[CategoryID],
        ob.[BookID],
        ob.[BookTitle],
        ob.[UnitPrice]
FROM    [Purchasing].[Book] ob
WHERE   ob.[UnitPrice] = (  SELECT  MIN(ib.[UnitPrice])
                            FROM    [Purchasing].[Book] ib
                            WHERE   ib.[CategoryID] = ob.[CategoryID])

--MIMIC THE FIRST PASS
SELECT  MIN(ib.[UnitPrice])
FROM    [Purchasing].[Book] ib
WHERE   ib.[CategoryID] = 1


--GET THE LOWEST PRICE BOOK IN EACH CATEGORY
SELECT  ob.[CategoryID],
        ob.[BookID],
        ob.[BookTitle],
        ob.[UnitPrice]
FROM    [Purchasing].[Book] ob
WHERE   ob.[UnitPrice] IN (  SELECT  MIN(ib.[UnitPrice])
                            FROM    [Purchasing].[Book] ib
                            WHERE   ib.[CategoryID] = ob.[CategoryID])


/********************************************************************
DEMO 2b – Corelated Subqueries using Comparison Operators
Subquery cannot return more than 1 value
********************************************************************/

--BUSINESS QUESTION
--FIND ALL OF THE ORDERS WHERE MORE THAN 5 OF BOOK ID 2 WERE ORDERED 
SELECT	orderHeaderID, customerID --RETUNS ALL OH FROM 1-12
FROM	Sales.OrderHeader a
WHERE	5 < (SELECT b.quantity
             FROM   Sales.OrderDetail b
             WHERE  b.bookID = 2
             AND    b.orderHeaderID = a.orderHeaderID) 

--Concept helper query (LOOP THROUGH HERE)
SELECT b.quantity, b.orderHeaderID
FROM   Sales.OrderDetail b
WHERE  b.bookID = 2
AND    b.orderHeaderID = 12


/********************************************************************
DEMO 4.3.2

Corelated Subqueries using EXISTS
********************************************************************/

--BUSINESS QUERTION
--I WANT TO KNOW ALL OF THE CUSTOMERS THAT PLACED AN ORDER BETWEEN
--START DATE AND END DATE INCLUSIVE
--PRODCUT RECALLS
SELECT	a.customerID,
		a.customerName
FROM	Sales.Customer a
WHERE	EXISTS (SELECT  'X'
                FROM	Sales.OrderHeader b
                WHERE	b.orderDate BETWEEN '01-FEB-2024' AND '31-MAR-2024'
                AND		a.customerID = b.customerID)


--Concept helper query
SELECT  *
FROM	Sales.OrderHeader b
WHERE	b.orderDate BETWEEN '01-FEB-2024' AND '31-MAR-2024'


SELECT	a.customerID,
		a.customerName
FROM	Sales.Customer a
WHERE	NOT EXISTS (    SELECT  'X'
                        FROM	Sales.OrderHeader b
                        WHERE	b.orderDate BETWEEN '01-FEB-2024' AND '31-MAR-2024'
                        AND		a.customerID = b.customerID)


