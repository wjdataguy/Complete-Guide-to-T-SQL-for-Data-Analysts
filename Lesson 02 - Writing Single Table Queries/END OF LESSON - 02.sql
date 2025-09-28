
-----------------------------------------------------------------------------
--Lesson 02 - Writing Single Table Queries

-----------------------------------------------------------------------------
--1.Get all book titles and unit costs for book that have a unit cost 
--between $50 and $80 (5 marks)

SELECT	BookTitle,
		UnitCost
FROM	Purchasing.Book
WHERE	UnitCost BETWEEN 50.00 AND 80.00

-----------------------------------------------------------------------------
--2.Get all books titles that have SQL in the title (5 marks)

SELECT	bookTitle,
		unitCost
FROM	Purchasing.Book
WHERE	bookTitle LIKE '%SQL%'

-----------------------------------------------------------------------------
--3.What is the average salary per job title (5 Marks)

SELECT	title, 
		avg(salary) AS [Average Salary]
FROM	[HumanResources].[Employee]
GROUP
BY		title

-----------------------------------------------------------------------------
--4.Using a case statement, display an employees first name, last name and
--the phrase “Big Cahuna” if their salary is >= $60000 and “SMALL FISH” 
--otherwise (5 marks) NULL VALUE ISSUE

SELECT	FirstName,
		LastName,
		CASE
		WHEN salary >= 60000 THEN 'Big Cahuna'
		WHEN salary < 60000 THEN 'SMALL FISH'
		ELSE 'No Salary Found'
		END AS phrase
FROM	[HumanResources].[Employee]
