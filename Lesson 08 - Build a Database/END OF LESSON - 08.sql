-----------------------------------------------------------------------------
--Lesson 08 - Build a Database
-----------------------------------------------------------------------------

--FOR THIS EXERCISE, CREATE YOUR OBJETCS IN THE 
--BookSellers database. I will use the dbo schema

USE BookSellers
GO

/************************************************
1.	Create a new table called COURSES with the 
following columns. Justify your Nullable. Make 
the course ID column an IDENTITY column            

Column Name	Data Type	Nullable
courseID	You Decide	You Decide
courseName	You Decide	You Decide
status		You Decide	You Decide
addedDate	You Decide	You Decide
************************************************/

--drop table dbo.courses

CREATE TABLE dbo.Course (
courseID	INTEGER 		NOT NULL IDENTITY,
courseName	VARCHAR(50) 	NOT NULL,
status		VARCHAR(1)		NOT NULL,
addedDate	DATETIME		NOT NULL)


/************************************************
2.	  
Using ALTER table statements add the 
following constraints: 
•	primary key (what is it?)
•	unique key on course name
•	check constraint on status to be (A)ctive or 
	(I)nactive
•	default for the added date to the timestamp 
	of the server when the row was added
************************************************/
ALTER TABLE dbo.course
	ADD CONSTRAINT pk_course
	PRIMARY KEY (courseID)

ALTER TABLE dbo.course
	ADD CONSTRAINT uk_course_courseName
	UNIQUE (courseName)

ALTER TABLE dbo.course
	ADD CONSTRAINT ck_course_status
	CHECK (status IN ('A', 'I'))

ALTER TABLE dbo.course
	ADD CONSTRAINT cn_course_addedDate
	DEFAULT getDate() FOR addedDate

/************************************************
3.	  
Add the following active courses: 
•	Project Management
•	SQL
•	Java
•	Negotiations 101
************************************************/

INSERT INTO dbo.course (courseName, status) VALUES ('Project Management', 'A')
INSERT INTO dbo.course (courseName, status) VALUES ('SQL', 'A')
INSERT INTO dbo.course (courseName, status) VALUES ('Java', 'A')
INSERT INTO dbo.course (courseName, status) VALUES ('Negotiations 101', 'A')

SELECT	*
FROM	dbo.course

/************************************************
4.	  
DROP the table named COURSES that you just creates

************************************************/

DROP TABLE dbo.course


/************************************************
5.	
Create a dynamic view that when run will list 
all employee first name, last name and hire dates 
for all employees hired in past 10 year to the day.    

************************************************/

CREATE VIEW dbo.vw_EmployeesHiredInPastTenYears
AS
SELECT	FirstName, LastName, hireDate
FROM	[HumanResources].[Employee]
WHERE	hireDate >= DATEADD(year, -10, getdate())

SELECT	*
FROM	dbo.vw_EmployeesHiredInPastTenYears

/************************************************
6.	
DROP the view that you just created in #13 that you just creates

************************************************/

DROP VIEW  dbo.vw_EmployeesHiredInPastTenYears