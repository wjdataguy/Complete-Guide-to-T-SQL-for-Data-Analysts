/********************************************************************
DEMO 3.1.1

OUR TWO SAMPLE SETS
********************************************************************/

USE TSQLConceptDemos
GO

SELECT	MyAnimal
FROM	[DemoSets].[MyAnimals]


SELECT	YourAnimal
FROM	[DemoSets].[YourAnimals]














/********************************************************************
DEMO 3.2.1

INNER JOIN - ONLY VALUES THAT MATCH IN EACH TABLE (INNER)
********************************************************************/

SELECT	a.MyAnimal,
		b.YourAnimal
FROM	[DemoSets].[MyAnimals] a
INNER JOIN	[DemoSets].[YourAnimals] b
ON		a.MyAnimal = b.YourAnimal



SELECT	a.MyAnimal,
		b.YourAnimal
FROM	[DemoSets].[MyAnimals] a
JOIN	[DemoSets].[YourAnimals] b
ON		a.MyAnimal = b.YourAnimal











/********************************************************************
DEMO 3.3.1

LEFT OUTER JOIN
********************************************************************/

SELECT	a.MyAnimal,
		b.YourAnimal
FROM	[DemoSets].[MyAnimals] a 
LEFT OUTER JOIN [DemoSets].[YourAnimals] b
ON		a.MyAnimal = b.YourAnimal














/********************************************************************
DEMO 3.3.2

LEFT OUTER JOIN - SHOW ONLY MATCHES
********************************************************************/

SELECT	a.MyAnimal,
		b.YourAnimal
FROM	[DemoSets].[MyAnimals] a 
LEFT OUTER JOIN 	[DemoSets].[YourAnimals] b
ON		a.MyAnimal = b.YourAnimal
WHERE	b.YourAnimal IS NOT NULL
















/********************************************************************
DEMO 3.3.3

LEFT OUTER JOIN - SHOW DIFFERENCES
********************************************************************/

SELECT	a.MyAnimal,
		b.YourAnimal
FROM	[DemoSets].[MyAnimals] a 
LEFT OUTER JOIN 	[DemoSets].[YourAnimals] b
ON		a.MyAnimal = b.YourAnimal
WHERE	b.YourAnimal IS NULL












/********************************************************************
DEMO 3.3.4

RIGHT OUTER JOIN
********************************************************************/

SELECT	a.MyAnimal,
		b.YourAnimal
FROM	[DemoSets].[MyAnimals] a 
RIGHT OUTER JOIN [DemoSets].[YourAnimals] b
ON		a.MyAnimal = b.YourAnimal













/********************************************************************
DEMO 3.3.5

RIGHT OUTER JOIN - SHOW ONLY MATCHES
********************************************************************/

SELECT	a.MyAnimal,
		b.YourAnimal
FROM	[DemoSets].[MyAnimals] a 
RIGHT OUTER JOIN [DemoSets].[YourAnimals] b
ON		a.MyAnimal = b.YourAnimal
WHERE	a.MyAnimal IS NOT NULL












/********************************************************************
DEMO 3.3.6

RIGHT OUTER JOIN - SHOW DIFFERENCES
********************************************************************/

SELECT	a.MyAnimal,
		b.YourAnimal
FROM	[DemoSets].[MyAnimals] a 
RIGHT OUTER JOIN [DemoSets].[YourAnimals] b
ON		a.MyAnimal = b.YourAnimal
WHERE	a.MyAnimal IS NULL














/********************************************************************
DEMO 3.3.7

FULL OUTER JOIN
********************************************************************/

SELECT	a.MyAnimal,
		b.YourAnimal
FROM	[DemoSets].[MyAnimals] a
FULL OUTER JOIN	[DemoSets].[YourAnimals] b
ON		a.MyAnimal = b.YourAnimal















/********************************************************************
DEMO 3.4.1

CROSS JOIN
********************************************************************/

SELECT	a.MyAnimal,
		b.YourAnimal
FROM	[DemoSets].[MyAnimals] a 
CROSS JOIN [DemoSets].[YourAnimals] b




















/********************************************************************
DEMO 3.5.1

SELF JOIN
********************************************************************/

USE	BookSellers
GO

SELECT	*
FROM	HumanResources.Employee


SELECT	e1.FirstName + ' ' + 
		e1.LastName AS Employee,
		e2.FirstName + ' ' + 
		e2.LastName AS ReportsTo
FROM	HumanResources.Employee e1 JOIN HumanResources.Employee e2
								ON e1.reportsToID = e2.employeeID
ORDER
BY		e2.employeeID


SELECT	e1.FirstName + ' ' + 
		e1.LastName AS Employee,
		e2.FirstName + ' ' + 
		e2.LastName AS ReportsTo
FROM	HumanResources.Employee e1 LEFT OUTER JOIN HumanResources.Employee e2
                                      ON e1.reportsToID = e2.employeeID
ORDER
BY		e2.employeeID


/********************************************************************
DEMO 3.5.2

THETA JOIN
********************************************************************/

SELECT	*
FROM	Sales.OrderHeader 


SELECT	*
FROM	Sales.TaxTable


SELECT	oh.orderDate, 
		tt.rate
FROM	Sales.OrderHeader oh JOIN Sales.TaxTable tt
                             ON oh.orderDate BETWEEN tt.startDate 
                                                 AND tt.endDate