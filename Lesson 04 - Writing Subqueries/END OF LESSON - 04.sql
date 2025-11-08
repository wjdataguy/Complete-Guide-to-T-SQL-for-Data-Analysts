-----------------------------------------------------------------------------
--Lesson 04 - Writing Subqueries
-----------------------------------------------------------------------------

/************************************************
1.	
Using a Sub query, give a list of all book 
titles that have a category name of Travel or Romance 
************************************************/
SELECT	bookTitle
FROM	[Purchasing].[Book]
WHERE	categoryID IN (SELECT categoryID
                       FROM   [Purchasing].[Category]
                       WHERE  categoryName IN ('Travel', 'Romance'))

/************************************************
2.	
Using a correlated sub query, select All category 
id and category names for all categories that do 
not have a book in them 
************************************************/
SELECT	a.categoryID, a.categoryName
FROM	[Purchasing].[Category] a
WHERE	NOT EXISTS (SELECT b.categoryID
                    FROM   [Purchasing].[Book] b
                    WHERE  a.categoryID = b.categoryID)

/************************************************
3.	
List all employee first name, last name and 
salaries for those employees that have a salary 
greater than ALL of the sales people. 
Caveat: exclude the NULL valued salary otherwise 
no rows will come back. 
************************************************/

SELECT	a.FirstName, a.LastName, a.salary
FROM	[HumanResources].[Employee] a 
WHERE	a.salary > ALL (SELECT b.salary
                        FROM   [HumanResources].[Employee] b
                        WHERE  title = 'SALES'
                        AND    salary IS NOT NULL)


