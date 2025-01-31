CREATE TABLE EMPLOYEEDETAILS
(
	EmployeeID Int Primary Key,
	EmployeeName Varchar(100) Not Null,
	ContactNo Varchar(100) Not Null,
	Department Varchar(100) Not Null,
	Salary Decimal(10,2) Not Null,
	JoiningDate DateTime Null
)

CREATE TABLE EmployeeLogs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
    EmployeeName VARCHAR(100) NOT NULL,
    ActionPerformed VARCHAR(100) NOT NULL,
    ActionDate DATETIME NOT NULL
);

--TRUNCATE TABLE EmployeeDetails
SELECT * FROM EmployeeDetails

--1)	Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to display the message "Employee record inserted", "Employee record updated", "Employee record deleted"
CREATE TRIGGER  TR_EmployeeDetails_AFTER_INSERT
ON EmployeeDetails
AFTER INSERT
AS
BEGIN
		PRINT 'Employee record inserted'
END

--INSERT INTO EmployeeDetails VALUES (1,'ABC','3265698214','CE',12200.00,GETDATE())

CREATE TRIGGER  TR_EmployeeDetails_AFTER_UPDATE
ON EmployeeDetails
AFTER UPDATE
AS
BEGIN
		PRINT 'Employee record updated'
END

--UPDATE EmployeeDetails SET EmployeeName = 'XYZ' WHERE EmployeeID = 1

CREATE TRIGGER  TR_EmployeeDetails_AFTER_DELETE
ON EmployeeDetails
AFTER DELETE
AS
BEGIN
		PRINT 'Employee record deleted'
END

--DELETE FROM EmployeeDetails WHERE EmployeeID = 1

--2)	Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to log all operations into the EmployeeLog table.
CREATE TRIGGER  TR_EmployeeDetails_AFTER_IUD_LOG
ON EmployeeDetails
AFTER INSERT
AS
BEGIN
		DECLARE @EmployeeID Int, @EmployeeName Varchar(100)
		SELECT @EmployeeID = EmployeeID FROM inserted
		SELECT @EmployeeName = EmployeeName FROM inserted

		INSERT INTO EmployeeLogs (EmployeeID ,EmployeeName ,ActionPerformed ,ActionDate)
		VALUES (@EmployeeID,@EmployeeName,'INSERT',GETDATE())
END

--INSERT INTO EmployeeDetails VALUES (1,'ABC','3265698214','CE',12200.00,GETDATE())
--SELECT * FROM EmployeeLogs

CREATE TRIGGER  TR_EmployeeDetails_AFTER_UPDATE_LOG
ON EmployeeDetails
AFTER UPDATE
AS
BEGIN
		DECLARE @EmployeeID Int, @EmployeeName Varchar(100)
		SELECT @EmployeeID = EmployeeID FROM inserted
		SELECT @EmployeeName = EmployeeName FROM inserted

		INSERT INTO EmployeeLogs (EmployeeID ,EmployeeName ,ActionPerformed ,ActionDate)
		VALUES (@EmployeeID,@EmployeeName,'UPDATE',GETDATE())
END

--UPDATE EmployeeDetails SET EmployeeName = 'XYZ' WHERE EmployeeID = 1

CREATE TRIGGER  TR_EmployeeDetails_AFTER_DELETE_LOG
ON EmployeeDetails
AFTER DELETE
AS
BEGIN
		DECLARE @EmployeeID Int, @EmployeeName Varchar(100)
		SELECT @EmployeeID = EmployeeID FROM deleted
		SELECT @EmployeeName = EmployeeName FROM deleted

		INSERT INTO EmployeeLogs (EmployeeID ,EmployeeName ,ActionPerformed ,ActionDate)
		VALUES (@EmployeeID,@EmployeeName,'DELETE',GETDATE())
END

--DELETE FROM EmployeeDetails WHERE EmployeeID = 1

--3)	Create a trigger that fires AFTER INSERT to automatically calculate the joining bonus (10% of the salary) for new employees and update a bonus column in the EmployeeDetails table.
CREATE TRIGGER  TR_EmployeeDetails_AFTER_INSERT_BONUS
ON EmployeeDetails
AFTER INSERT
AS
BEGIN
		DECLARE @EmployeeID Int,@Salary  Decimal(10,2)
		SELECT @EmployeeID = EmployeeID FROM inserted
		SELECT @Salary = Salary FROM inserted

		SET @Salary = @Salary + (@Salary * 0.1)

		UPDATE EMPLOYEEDETAILS
		SET Salary = @Salary
		WHERE EmployeeID = @EmployeeID
		
END

--INSERT INTO EmployeeDetails VALUES (1,'ABC','3265698214','CE',12200.00,NULL)
--SELECT * FROM EmployeeDetails

--4)	Create a trigger to ensure that the JoiningDate is automatically set to the current date if it is NULL during an INSERT operation.
CREATE TRIGGER  TR_EmployeeDetails_AFTER_INSERT_JoiningDate
ON EmployeeDetails
AFTER INSERT
AS
BEGIN
		DECLARE @EmployeeID Int,@JoiningDate  DATETIME
		SELECT @EmployeeID = EmployeeID FROM inserted
		SELECT @JoiningDate = JoiningDate FROM inserted

		IF @JoiningDate IS NULL
			UPDATE EMPLOYEEDETAILS
			SET JoiningDate = GETDATE()
			WHERE EmployeeID = @EmployeeID 
		
END

--5)	Create a trigger that ensure that ContactNo is valid during insert and update (Like ContactNo length is 10)
CREATE TRIGGER  TR_EmployeeDetails_CHECK_ContactNo
ON EmployeeDetails
AFTER INSERT,UPDATE
AS
BEGIN
		DECLARE @EmployeeID Int,@ContactNo  VARCHAR(100)
		SELECT @EmployeeID = EmployeeID FROM inserted
		SELECT @ContactNo = ContactNo FROM inserted

		IF LEN(@ContactNo) = 10
				PRINT 'VALID'
				
		
END


CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    MovieTitle VARCHAR(255) NOT NULL,
    ReleaseYear INT NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    Rating DECIMAL(3, 1) NOT NULL,
    Duration INT NOT NULL
);

CREATE TABLE MoviesLog
(
	LogID INT PRIMARY KEY IDENTITY(1,1),
	MovieID INT NOT NULL,
	MovieTitle VARCHAR(255) NOT NULL,
	ActionPerformed VARCHAR(100) NOT NULL,
	ActionDate	DATETIME  NOT NULL
);


--1.	Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the Movies table. For that, log all operations performed on the Movies table into MoviesLog.
CREATE TRIGGER  TR_Movies_INSERT
ON Movies
INSTEAD OF INSERT
AS
BEGIN
		DECLARE @MovieID Int, @MovieTitle Varchar(100)
		SELECT @MovieID = MovieID FROM inserted
		SELECT @MovieTitle = MovieTitle FROM inserted

		INSERT INTO MoviesLog (MovieID ,MovieTitle ,ActionPerformed ,ActionDate)
		VALUES (@MovieID,@MovieTitle,'INSERT',GETDATE())
END

--INSERT INTO Movies VALUES (1,'XYZ',2025,'GG',3.2,3)
--SELECT * FROM MoviesLog

--2.	Create a trigger that only allows to insert movies for which Rating is greater than 5.5 .


--3.	Create trigger that prevent duplicate 'MovieTitle' of Movies table and log details of it in MoviesLog table.


--4.	Create trigger that prevents to insert pre-release movies.


--5.	Develop a trigger to ensure that the Duration of a movie cannot be updated to a value greater than 120 minutes (2 hours) to prevent unrealistic entries.

