/********************************************************************
DEMO 2.3.1

Basic comparisons
********************************************************************/

SELECT	[BookTitle],
		[UnitPrice],
		[Discontinued]
FROM	[Purchasing].[Book]


SELECT	[BookTitle],
		[UnitPrice],
		[Discontinued]
FROM	[Purchasing].[Book]
WHERE	[Discontinued] = 'Y'


SELECT	[BookTitle],
		[UnitPrice],
		[Discontinued]
FROM	[Purchasing].[Book]
WHERE	[UnitPrice] < 42.99


SELECT	[BookTitle],
		[UnitPrice],
		[Discontinued]
FROM	[Purchasing].[Book]
WHERE	[BookTitle] < 'K'
