--Part – A
=========================================================================================================================
--1. Write a function to print "hello world".
CREATE OR ALTER FUNCTION FN_PRINT_HELLO()
RETURNS VARCHAR(50)
AS
BEGIN
		RETURN 'HELLO WORLD'
END

SELECT DBO.FN_PRINT_HELLO()
=========================================================================================================================
--2. Write a function which returns addition of two numbers.
CREATE OR ALTER FUNCTION FN_ADDITION(@N1 INT,@N2 INT)
RETURNS INT
AS
BEGIN
		RETURN @N1+@N2
END

SELECT DBO.FN_ADDITION(10,20) AS SUM
=========================================================================================================================
--3. Write a function to check whether the given number is ODD or EVEN.
CREATE OR ALTER FUNCTION FN_ODD_EVEN(@NO INT)
RETURNS VARCHAR(50)
AS
BEGIN
		DECLARE @MSG VARCHAR(50)
		IF @NO % 2 = 0
			SET @MSG = 'NO IS EVEN'
		ELSE
			SET @MSG = 'NO IS ODD'
		RETURN @MSG
END

SELECT DBO.FN_ODD_EVEN(35)
=========================================================================================================================
--4. Write a function which returns a table with details of a person whose first name starts with B.
CREATE OR ALTER FUNCTION FN_PERSON_DETAILS()
RETURNS TABLE
AS
		RETURN (SELECT * FROM PERSON 
				WHERE FirstName LIKE 'B%')


SELECT * FROM DBO.FN_PERSON_DETAILS()
=========================================================================================================================
--5. Write a function which returns a table with unique first names from the person table.
CREATE OR ALTER FUNCTION FN_PERSON_UNIQUEDETAILS()
RETURNS TABLE
AS
		RETURN (SELECT DISTINCT FirstName FROM PERSON)

SELECT * FROM DBO.FN_PERSON_UNIQUEDETAILS()
=========================================================================================================================
--6. Write a function to print number from 1 to N. (Using while loop)
CREATE OR ALTER FUNCTION FN_PRINT_1TON(@NO INT)
RETURNS VARCHAR(200)
AS
BEGIN
		DECLARE @MSG VARCHAR(200),
				@COUNT INT
		SET @MSG = ''
		SET @COUNT = 1
		WHILE(@COUNT <= @NO)
		BEGIN
			SET @MSG = @MSG + ' ' +CAST(@COUNT AS VARCHAR)
			SET @COUNT = @COUNT + 1
		END
		RETURN @MSG
END

SELECT DBO.FN_PRINT_1TON(10)
========================================================================================================================
--7. Write a function to find the factorial of a given integer.
CREATE OR ALTER FUNCTION FN_PRINT_FACTORIAL(@NO INT)
RETURNS INT
AS
BEGIN
		DECLARE @MSG INT,
				@COUNT INT
		SET @MSG = 1
		SET @COUNT = 1
		WHILE(@COUNT <= @NO)
		BEGIN
			SET @MSG = @MSG * @COUNT
			SET @COUNT = @COUNT + 1
		END
		RETURN @MSG
END

SELECT DBO.FN_PRINT_FACTORIAL(5)

--Part – B
========================================================================================================================
--8. Write a function to compare two integers and return the comparison result. (Using Case statement)
CREATE OR ALTER FUNCTION FN_COMPARE_TWO(@a INT,@b INT)
RETURNS VARCHAR(50)
AS
BEGIN
	RETURN (CASE
				WHEN @a>@b THEN 'First is greater than second'
				WHEN @a<@b THEN 'First is less than second'
				ELSE 'Both are equal'
			END)
END

SELECT dbo.FN_COMPARE_TWO(4,6)
========================================================================================================================
--9. Write a function to print the sum of even numbers between 1 to 20.
CREATE OR ALTER FUNCTION FN_SUM_EVEN()
RETURNS INT
AS
BEGIN
		DECLARE @i INT=2,
				@ANS INT=0
		WHILE @i<20
		BEGIN
			SET @ANS=@ANS+@i
			SET @i=@i+2
		END
		RETURN @ANS
END

SELECT dbo.FN_SUM_EVEN()

========================================================================================================================
--10. Write a function that checks if a given string is a palindrome.
CREATE OR ALTER FUNCTION FN_PALINDROME(@str VARCHAR(100))
RETURNS VARCHAR(50)
AS
BEGIN
		DECLARE @MSG VARCHAR(50)=''
		IF @str=REVERSE(@str)
			SET @MSG='PALINDROME'
		ELSE
			SET @MSG='NOT A PALINDROME'
		RETURN @MSG
END

SELECT dbo.FN_PALINDROME('MNM')