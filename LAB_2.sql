CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);CREATE TABLE Person (
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
