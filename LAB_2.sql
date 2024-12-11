CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Person (
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);



--1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures
CREATE OR ALTER PROCEDURE PR_INSERT_Department
 @DEPT_ID INT,
 @DEPT_NAME VARCHAR(100)
AS
BEGIN
	INSERT INTO Department
	VALUES
	(@DEPT_ID,@DEPT_NAME)
END

EXEC PR_INSERT_Department 1,'Admin'
EXEC PR_INSERT_Department 2,'IT'
EXEC PR_INSERT_Department 3,'HR'
EXEC PR_INSERT_Department 4,'Account'
---------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE PR_INSERT_Designation
 @DE_ID INT,
 @DE_NAME VARCHAR(100)
AS
BEGIN
	INSERT INTO Designation
	VALUES
	(@DE_ID,@DE_NAME)
END

EXEC PR_INSERT_Designation 11,'Jobber'
EXEC PR_INSERT_Designation 12,'Welder'
EXEC PR_INSERT_Designation 13,'Clerk'
EXEC PR_INSERT_Designation 14,'Manager'
EXEC PR_INSERT_Designation 15,'CEO'

SELECT * FROM Designation
---------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE PR_INSERT_Person
 @P_FNAME VARCHAR(100),
 @P_LNAME VARCHAR(100),
 @P_SAL INT,
 @P_JDATE DATETIME,
 @DEPT_ID INT,
 @DE_ID INT
AS
BEGIN
	INSERT INTO Person
	VALUES
	(@P_FNAME,@P_LNAME,@P_SAL,@P_JDATE,@DEPT_ID,@DE_ID)
END

EXEC PR_INSERT_Person 'Rahul','Anshu',56000,'1990-01-01',1,12
EXEC PR_INSERT_Person 'Hardik','Hinsu',18000,'1990-09-25',2,11
EXEC PR_INSERT_Person 'Bhavin','Kamani',25000,'1991-05-14',NULL,11
EXEC PR_INSERT_Person 'Bhoomi','Patel',39000,'2014-02-20',1,13
EXEC PR_INSERT_Person 'Rohit','Rajgor',17000,'1990-07-23',2,15
EXEC PR_INSERT_Person 'Priya','Mehta',25000,'1990-10-18',2,NULL
EXEC PR_INSERT_Person 'Neha','Trivedi',18000,'2014-02-20',3,15

SELECT *  FROM Person

---------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE PR_DELETE_Department
 @DEPT_ID INT
AS
BEGIN
	DELETE FROM Department
	WHERE DepartmentID = @DEPT_ID
END

EXEC PR_DELETE_Department 1
---------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE PR_DELETE_Designation
 @DE_ID INT
AS
BEGIN
	DELETE FROM Designation
	WHERE DesignationID = @DE_ID
END

EXEC PR_DELETE_Designation 11
---------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE PR_DELETE_Person
 @P_ID INT
AS
BEGIN
	DELETE FROM Person
	WHERE PersonID = @P_ID
END

EXEC PR_DELETE_Person 101
---------------------------------------------------------------------------------------------------------------------

CREATE OR ALTER PROCEDURE PR_UPDATE_Person
 @P_ID INT,@P_FNAME VARCHAR(100)
AS
BEGIN
	UPDATE Person
	SET FirstName = @P_FNAME
	WHERE PersonID = @P_ID
END

EXEC PR_UPDATE_Person 101,'UTSAV'
---------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE PR_UPDATE_Department
 @DEPT_ID INT,@DEPT_NAME VARCHAR(100)
AS
BEGIN
	UPDATE Department
	SET DepartmentName = @DEPT_NAME
	WHERE DepartmentID = @DEPT_ID
END

EXEC PR_UPDATE_Person 1,'ADMIN'
---------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE PR_UPDATE_Designation
 @DE_ID INT,@DE_NAME VARCHAR(100)
AS
BEGIN
	UPDATE Designation
	SET DesignationName = @DE_NAME
	WHERE DesignationName = @DE_ID
END

EXEC PR_UPDATE_Person 11,'JOBBER'
---------------------------------------------------------------------------------------------------------------------
--2 Department, Designation & Person Table’s SELECTBYPRIMARYKEY
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_SELECTBYPRIMARYKEY
@DID INT
AS
BEGIN
	SELECT * FROM Department WHERE DepartmentID=@DID
END
---------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE PR_DESIGNATION_SELECTBYPRIMARYKEY
@DID INT
AS
BEGIN
	SELECT * FROM Designation WHERE DesignationID=@DID
END
---------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE PR_PERSON_SELECTBYPRIMARYKEY
@PID INT
AS
BEGIN
	SELECT * FROM Person WHERE PersonID=@PID
END
---------------------------------------------------------------------------------------------------------------------
--3 Department, Designation & Person Table’s (If foreign key is available then do write join and take columns on select list) 
CREATE OR ALTER PROCEDURE PR_PERSON_JOIN
AS
BEGIN
	SELECT * 
	FROM PERSON AS P JOIN DEPARTMENT AS DEP 
	ON P.DepartmentID=DEP.DepartmentID JOIN DESIGNATION AS desi 
	ON p.designationID=desi.designationID
END
---------------------------------------------------------------------------------------------------------------------
--4 Create a Procedure that shows details of the first 3 persons.
CREATE OR ALTER PROCEDURE PR_PERSON_FIRST_THREE
AS
BEGIN
	SELECT TOP 3 * FROM PERSON
END
---------------------------------------------------------------------------------------------------------------------
--PART-B
--5 Create a Procedure that takes the department name as input and returns a table with all workers working in that department.
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_NAME
@DeptName varchar(100)
AS
BEGIN
	SELECT * 
	FROM PERSON AS p JOIN DEPARTMENT AS d 
	ON p.departmentID=d.departmentID 
	WHERE d.DepartmentName=@DeptName
END
---------------------------------------------------------------------------------------------------------------------
--6 Create Procedure that takes department name & designation name as input and returns a table with worker’s first name, salary, joining date & department name. 
CREATE OR ALTER PROCEDURE PR_PERSON_DISPLAY
@DeptName varchar(100),
@DesName varchar(100)
AS
BEGIN
	SELECT FirstName,Salary,JoiningDate,DepartmentName 
	FROM PERSON AS p join Department AS dep 
	on p.DepartmentID=dep.DepartmentID 
	join Designation AS desi 
	on p.DesignationID=desi.DesignationID
	WHERE dep.departmentName=@DeptName AND desi.designationName=@DesName
END
---------------------------------------------------------------------------------------------------------------------
--7 Create a Procedure that takes the first name as an input parameter and display all the details of the worker with their department & designation name.
CREATE OR ALTER PROCEDURE PR_PERSON_FIRSTNAME
@FName varchar(100)
AS
BEGIN
	SELECT * 
	FROM Person AS p join department as dep 
	on p.departmentID=dep.departmentID 
	join designation as desi 
	on p.designationID=desi.designationID
	where p.FirstName=@FName
END
---------------------------------------------------------------------------------------------------------------------
--8 Create Procedure which displays department wise maximum, minimum & total salaries.
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_MAX_MIN_SUM
AS
BEGIN
	SELECT dep.DepartmentName,MAX(p.SALARY),MIN(p.SALARY),SUM(p.SALARY) 
	FROM Department AS dep JOIN Person AS p 
	on p.DepartmentID=dep.DepartmentID
	group by dep.DepartmentName
END
---------------------------------------------------------------------------------------------------------------------
--9 Create Procedure which displays designation wise average & total salaries.
CREATE OR ALTER PROCEDURE PR_DESIGNATION_AVG_SUM
AS
BEGIN
	SELECT desi.DesignationName,AVG(p.salary),SUM(p.salary) 
	FROM PERSON AS P JOIN DESIGNATION AS DESI 
	ON P.DESIGNATIONID=DESI.DESIGNATIONID
	GROUP BY desi.DesignationName
END
---------------------------------------------------------------------------------------------------------------------
--PART-C
--10 Create Procedure that Accepts Department Name and Returns Person Count.
CREATE OR ALTER PROCEDURE PR_PERSON_COUNT
@DeptName varchar(100)
AS
BEGIN
	SELECT COUNT(p.PERSONID) 
	FROM PERSON AS p JOIN Department AS dept 
	on p.DepartmentID=dept.DepartmentID 
	WHERE DepartmentName=@DeptName
END
---------------------------------------------------------------------------------------------------------------------
--11 Create a procedure that takes a salary value as input and returns all workers with a salary greater than input salary value along with their department and designation details.
CREATE OR ALTER PROCEDURE PR_PERSON_SALARY
@Sal Decimal(8,2)
AS
BEGIN
	SELECT * 
	FROM PERSON AS P JOIN DEPARTMENT AS DEP 
	ON P.DEPARTMENTID=DEP.DEPARTMENTID 
	JOIN DESIGNATION AS DESI 
	ON P.DESIGNATIONID=DESI.DESIGNATIONID
	WHERE P.SALARY>@Sal
END
---------------------------------------------------------------------------------------------------------------------
--12 Create a procedure to find the department(s) with the highest total salary among all departments.
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_TOTAL_SAL
AS
BEGIN
	SELECT dep.DepartmentName, SUM(p.salary) AS TotalSalary 
	FROM Department AS dep JOIN Person AS p 
	ON dep.DepartmentID = p.DepartmentID 
	GROUP BY dep.DepartmentName 
	HAVING SUM(p.salary) = (SELECT MAX(DepartmentTotal) FROM (SELECT SUM(p.salary) AS DepartmentTotal FROM Department AS d JOIN Person AS p ON d.DepartmentID = p.DepartmentID GROUP BY d.DepartmentID) AS Subquery);

END
---------------------------------------------------------------------------------------------------------------------
--13  Create a procedure that takes a designation name as input and returns a list of all workers under that designation who joined within the last 10 years, along with their department.
CREATE OR ALTER PROCEDURE PR_DESIGNATION_LAST_TEN
@DesigName varchar(100)
AS
BEGIN
	SELECT p.FirstName,p.LastName,dep.DepartmentName FROM PERSON AS p join Department AS dep on p.DepartmentID=dep.DepartmentID join Designation AS desig on p.DesignationID=desig.DesignationID
	where year(getDate())-year(p.JoiningDate)<=10
END
---------------------------------------------------------------------------------------------------------------------
--14 Create a procedure to list the number of workers in each department who do not have a designation assigned.
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_NO_DESIGNATION
AS
BEGIN
	SELECT dep.DepartmentName,p.FirstName,p.LastName FROM DEPARTMENT AS dep JOIN PERSON AS p on dep.DepartmentID=p.DepartmentID where p.DesignationID IS NULL
END
---------------------------------------------------------------------------------------------------------------------
--15 Create a procedure to retrieve the details of workers in departments where the average salary is above 12000. 
CREATE OR ALTER PROCEDURE PR_DEPARTMENT_AVG_SAL
AS
BEGIN
	SELECT dept.DepartmentName,avg(p.salary) FROM DEPARTMENT AS dept JOIN PERSON AS p ON dept.DepartmentID=p.DepartmentID group by dept.DepartmentName having avg(p.salary)>12000
END
