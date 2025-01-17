CREATE TABLE Products (
 Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL
);

INSERT INTO Products (Product_id, Product_Name, Price) VALUES
(1, 'Smartphone', 35000),
(2, 'Laptop', 65000),
(3, 'Headphones', 5500),
(4, 'Television', 85000),
(5, 'Gaming Console', 32000);

---------------------------------PART-A---------------------------------
--1. Create a cursor Product_Cursor to fetch all the rows from a products table.
DECLARE @Product_id INT,
		@Product_Name VARCHAR(250),
		@Price DECIMAL(10, 2)
DECLARE Product_Cursor CURSOR 
FOR SELECT Product_id,Product_Name,Price 
	FROM Products
OPEN  Product_Cursor
FETCH NEXT FROM Product_Cursor INTO 
	@Product_id,
	@Product_Name,
	@Price
WHILE @@FETCH_STATUS = 0
	BEGIN 
		PRINT CAST(@Product_id AS VARCHAR)+'-'+@Product_Name+'-'+CAST(@Price AS VARCHAR)
		FETCH NEXT FROM Product_Cursor INTO 
			@Product_id,
			@Product_Name,
			@Price
	END
CLOSE Product_Cursor
DEALLOCATE Product_Cursor

--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName.
--(Example: 1_Smartphone)
DECLARE @Product_id INT,
		@Product_Name VARCHAR(250)
DECLARE Product_Cursor_Fetch CURSOR 
FOR SELECT Product_id,Product_Name 
	FROM Products
OPEN  Product_Cursor_Fetch
FETCH NEXT FROM Product_Cursor_Fetch INTO 
	@Product_id,
	@Product_Name
WHILE @@FETCH_STATUS = 0
	BEGIN 
		PRINT CAST(@Product_id AS VARCHAR)+'_'+@Product_Name
		FETCH NEXT FROM Product_Cursor_Fetch INTO 
			@Product_id,
			@Product_Name
	END
CLOSE Product_Cursor_Fetch
DEALLOCATE Product_Cursor_Fetch

--3. Create a Cursor to Find and Display Products Above Price 30,000.
DECLARE @Product_id INT,
		@Product_Name VARCHAR(250),
		@Price DECIMAL(10, 2)
DECLARE Product_Cursor_PRICE CURSOR 
FOR SELECT Product_id,Product_Name,Price 
	FROM Products
OPEN  Product_Cursor_PRICE
FETCH NEXT FROM Product_Cursor_PRICE INTO 
	@Product_id,
	@Product_Name,
	@Price
WHILE @@FETCH_STATUS = 0
	BEGIN 
		IF @Price >= 30000
			PRINT CAST(@Product_id AS VARCHAR)+'-'+@Product_Name+'-'+CAST(@Price AS VARCHAR)
		FETCH NEXT FROM Product_Cursor_PRICE INTO 
			@Product_id,
			@Product_Name,
			@Price
	END
CLOSE Product_Cursor_PRICE
DEALLOCATE Product_Cursor_PRICE

--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.DECLARE @Product_id INT
DECLARE Product_CursorDelete CURSOR 
FOR SELECT Product_id FROM Products
OPEN  Product_CursorDelete
FETCH NEXT FROM Product_CursorDelete INTO 
	@Product_id
WHILE @@FETCH_STATUS = 0
	BEGIN 
		DELETE FROM Products
		WHERE Product_id = @Product_id
		FETCH NEXT FROM Product_CursorDelete INTO 
			@Product_id
	END
CLOSE Product_CursorDelete
DEALLOCATE Product_CursorDelete

---------------------------------PART-B---------------------------------
--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases
--the price by 10%.
DECLARE @Product_id INT,
		@Price DECIMAL(10, 2)
DECLARE Product_CursorUpdate CURSOR 
FOR SELECT Product_id,Price FROM Products
OPEN  Product_CursorUpdate
FETCH NEXT FROM Product_CursorUpdate INTO 
	@Product_id,
	@Price
WHILE @@FETCH_STATUS = 0
	BEGIN 
		UPDATE Products 
		SET Price = Price + Price*0.1
		WHERE Product_id = @Product_id
		FETCH NEXT FROM Product_CursorUpdate INTO 
			@Product_id,
			@Price
	END
CLOSE Product_CursorUpdate
DEALLOCATE Product_CursorUpdate


--6. Create a Cursor to Rounds the price of each product to the nearest whole number.
DECLARE @Product_id INT,
		@Price DECIMAL(10, 2)
DECLARE Product_CursorUpdate_ROUND CURSOR 
FOR SELECT Product_id,Price FROM Products
OPEN  Product_CursorUpdate_ROUND
FETCH NEXT FROM Product_CursorUpdate_ROUND INTO 
	@Product_id,
	@Price
WHILE @@FETCH_STATUS = 0
	BEGIN 
		UPDATE Products 
		SET Price = ROUND(PRICE,3)
		WHERE Product_id = @Product_id
		FETCH NEXT FROM Product_CursorUpdate_ROUND INTO 
			@Product_id,
			@Price
	END
CLOSE Product_CursorUpdate_ROUND
DEALLOCATE Product_CursorUpdate_ROUND

SELECT * FROM Products
---------------------------------PART-B---------------------------------
CREATE TABLE NewProducts (
 Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL
);

--7. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop”
--(Note: Create NewProducts table first with same fields as Products table)
DECLARE 
	@Product_id INT,
	@Product_Name VARCHAR(250),
	@Price DECIMAL(10, 2)
DECLARE Product_Cursorinsert CURSOR
FOR SELECT
		Product_id , 
		Product_Name, 
		Price
	FROM
		Products;
	OPEN Product_Cursorinsert;
FETCH NEXT FROM Product_Cursorinsert INTO
		@Product_id, 
		@Product_Name, 
		@Price ;
WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @Product_Name='laptop'
		INSERT INTO NewProducts VALUES (@Product_id, @Product_Name, @Price);
		FETCH NEXT FROM Product_Cursorinsert INTO
			@Product_id, 
			@Product_Name, 
			@Price ;
	END;
CLOSE Product_Cursorinsert;
DEALLOCATE Product_Cursorinsert;

SELECT * FROM NewProducts
TRUNCATE TABLE NewProducts

--8. Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products
--with a price above 50000 to an archive table, removing them from the original Products table.

DECLARE @Product_id INT,
		@Product_Name VARCHAR(250),
		@Price DECIMAL(10, 2)

DECLARE Product_Cursor_INSERT_NEW CURSOR 
FOR SELECT Product_id,Product_Name,Price 
	FROM Products
	WHERE Price >= 50000
OPEN  Product_Cursor_INSERT_NEW
FETCH NEXT FROM Product_Cursor_INSERT_NEW INTO 
	@Product_id,
	@Product_Name,
	@Price
WHILE @@FETCH_STATUS = 0
	BEGIN 
		INSERT INTO NewProducts(Product_id,Product_Name,Price)
		VALUES
		(@Product_id,@Product_Name,@Price)
		DELETE FROM Products
		WHERE Product_id = @Product_id
		FETCH NEXT FROM Product_Cursor_INSERT_NEW INTO 
			@Product_id,
			@Product_Name,
			@Price
	END
CLOSE Product_Cursor_INSERT_NEW
DEALLOCATE Product_Cursor_INSERT_NEW

SELECT * FROM NewProducts
SELECT * FROM Products
TRUNCATE TABLE NewProducts