
/********************************************************************
DEMO 5.1.1

OUR TWO SAMPLE SETS
********************************************************************/

USE TSQLConceptDemos
GO

SELECT	*
FROM	[DemoSets].[MyAnimals]

SELECT	*
FROM	[DemoSets].[YourAnimals]

/*
--FOCUS HERE ON THE RULES
THIS WILL FAIL
# OF COLUMNS IS THE SAME BUT DATATYPES DO NOT MATCH (OR ARE CONVERTABLE)
Msg 245, Level 16, State 1, Line 105
Conversion failed when converting the varchar value 'Yellow' to data type int.
*/
SELECT	*
FROM	[DemoSets].[MyAnimals]
UNION
SELECT	*
FROM	[DemoSets].[YourAnimals]

/*
--FOCUS HERE ON THE RULES
THIS WILL WORK AS # OF COLUMNS AND DATA TYPES LINE UP
*/
SELECT	[MyAnimal],
		[MyColor],
		[MyAge],
		[MyGivenName],
		[MyBirthDate]
FROM	[DemoSets].[MyAnimals]
UNION
SELECT	[YourAnimal],
		[YourColor],
		[YourAge],
		[YourGivenName],
		[YourBirthDate]
FROM	[DemoSets].[YourAnimals]


/*
THIS WILL FAIL AS THE NUMBER OF COLUMNS DOES NOT LINE UP
All queries combined using a UNION, INTERSECT or EXCEPT operator 
must have an equal number of expressions in their target lists.\
Notice that it errors out on the # of columns first, even though there
is a data type mismatch
*/
SELECT	[MyAnimal],
		[MyColor],
		[MyAge]
FROM	[DemoSets].[MyAnimals]
UNION
SELECT	[YourAnimal],
		[YourAge]
FROM	[DemoSets].[YourAnimals]

/*
WILL FAIL ON THE DATA TYPES NOW
*/
SELECT	[MyAnimal],
		[MyColor],
		[MyAge]
FROM	[DemoSets].[MyAnimals]
UNION
SELECT	[YourAnimal],
		[YourAge],
		[YourColor]
FROM	[DemoSets].[YourAnimals]

/********************************************************************
DEMO 5.1.2

ORDER BY
********************************************************************/

SELECT	[MyAnimal],
		[MyColor]
FROM	[DemoSets].[MyAnimals]
UNION ALL
SELECT	[YourAnimal],
		[YourColor]
FROM	[DemoSets].[YourAnimals]
ORDER
BY		[MyAnimal]

/********************************************************************
DEMO 5.1.3

NULLS ARE TREATED AS EQUAL
********************************************************************/

SELECT	[MyAnimal],
		[MyColor]
FROM	[DemoSets].[MyAnimals]
UNION
SELECT	[YourAnimal],
		[YourColor]
FROM	[DemoSets].[YourAnimals]
ORDER
BY		[MyAnimal]

/********************************************************************
DEMO 5.2.1

ORDER BY
********************************************************************/

SELECT	[MyAnimal],
		[MyColor]
FROM	[DemoSets].[MyAnimals]
UNION ALL
SELECT	[YourAnimal],
		[YourColor]
FROM	[DemoSets].[YourAnimals]
ORDER
BY		[MyAnimal]










/********************************************************************
DEMO 5.2.2

NULLS ARE TREATED AS EQUAL
********************************************************************/

SELECT	[MyAnimal],
		[MyColor]
FROM	[DemoSets].[MyAnimals]
UNION
SELECT	[YourAnimal],
		[YourColor]
FROM	[DemoSets].[YourAnimals]
ORDER
BY		[MyAnimal]









/********************************************************************
DEMO 5.3.1

EXCEPT
********************************************************************/

SELECT	[MyAnimal],
		[MyColor]
FROM	[DemoSets].[MyAnimals]

SELECT	[YourAnimal],
		[YourColor]
FROM	[DemoSets].[YourAnimals]

SELECT	[MyAnimal],
		[MyColor]
FROM	[DemoSets].[MyAnimals]
EXCEPT
SELECT	[YourAnimal],
		[YourColor]
FROM	[DemoSets].[YourAnimals]




/********************************************************************
DEMO 5.4.1

INTERSECT
********************************************************************/

SELECT	[MyAnimal],
		[MyColor]
FROM	[DemoSets].[MyAnimals]

SELECT	[YourAnimal],
		[YourColor]
FROM	[DemoSets].[YourAnimals]

SELECT	[MyAnimal],
		[MyColor]
FROM	[DemoSets].[MyAnimals]
INTERSECT
SELECT	[YourAnimal],
		[YourColor]
FROM	[DemoSets].[YourAnimals]