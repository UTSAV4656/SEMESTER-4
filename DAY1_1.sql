-- Create the EMP table
CREATE TABLE EMP (
    EID INT PRIMARY KEY,
    EName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    JoiningDate DATE,
    City VARCHAR(50),
    Gender VARCHAR(10)
);

-- Insert data into the EMP table
INSERT INTO EMP (EID, EName, Department, Salary, JoiningDate, City, Gender)
VALUES
(101, 'Rahul', 'Admin', 56000, '1990-01-01', 'Rajkot', 'Male'),
(102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad', 'Male'),
(103, 'Bhavin', 'HR', 25000, '1991-05-14', 'Baroda', 'Male'),
(104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot', 'Female'),
(105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar', 'Male'),
(106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad', 'Female'),
(107, 'Bhoomi', 'HR', 34000, '1991-12-25', 'Rajkot', 'Female'),
(108, 'Manish', 'IT', 22000, '1990-04-20', 'Baroda', 'Male'),
(109, 'Kavita', 'Admin', 35000, '1992-03-12', 'Ahmedabad', 'Female'),
(110, 'Suresh', 'HR', 28000, '1991-11-05', 'Jamnagar', 'Male'),
(111, 'Pooja', 'IT', 19000, '1991-01-30', 'Rajkot', 'Female'),
(112, 'Amit', 'Admin', 42000, '1990-08-19', 'Baroda', 'Male'),
(113, 'Rekha', 'HR', 31000, '1992-07-02', 'Ahmedabad', 'Female'),
(114, 'Vijay', 'IT', 20000, '1990-06-11', 'Rajkot', 'Male'),
(115, 'Meera', 'Admin', 38000, '1991-10-09', 'Jamnagar', 'Female');

-- Create the SALES_DATA table
CREATE TABLE SALES_DATA (
    Region VARCHAR(50),
    Product VARCHAR(50),
    Sales_Amount INT,
    Year INT
);

-- Insert data into the SALES_DATA table
INSERT INTO SALES_DATA (Region, Product, Sales_Amount, Year)
VALUES
('North America', 'Watch', 1500, 2023),
('Europe', 'Mobile', 1200, 2023),
('Asia', 'Watch', 1800, 2023),
('North America', 'TV', 900, 2024),
('Europe', 'Watch', 2000, 2024),
('Asia', 'Mobile', 1000, 2024),
('North America', 'Mobile', 1600, 2023),
('Europe', 'TV', 1500, 2023),
('Asia', 'TV', 1100, 2024),
('North America', 'Watch', 1700, 2024),
('Asia', 'Watch', 2200, 2024),
('Europe', 'Mobile', 1400, 2024),
('North America', 'TV', 1300, 2023),
('Asia', 'TV', 1000, 2023),
('Europe', 'Watch', 1800, 2023),
('North America', 'Mobile', 1100, 2024),
('Asia', 'Laptop', 3000, 2023),
('Europe', 'Laptop', 3500, 2024),
('North America', 'Laptop', 2800, 2024),
('Asia', 'Mobile', 1300, 2023);



--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
SELECT MAX(Salary) AS Maximum, MIN(Salary) AS Minimum
FROM EMP;


--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, respectively
SELECT SUM(Salary) AS Total_Sal, AVG(Salary) AS Average_Sal
FROM EMP;


--3. Find total number of employees of EMPLOYEE table.
SELECT COUNT(*) AS Total_Employees
FROM EMP;


--4. Find highest salary from Rajkot city
SELECT MAX(Salary) AS Highest_Salary
FROM EMP
WHERE City = 'Rajkot';


--5. Give maximum salary from IT department
SELECT MAX(Salary) AS Max_Salary_IT
FROM EMP
WHERE Department = 'IT';


--6. Count employee whose joining date is after 8-Feb-91
SELECT COUNT(*) AS Employees_After_Feb_91
FROM EMP
WHERE JoiningDate > '1991-02-08';


--7. Display average salary of Admin department.
SELECT AVG(Salary) AS Average_Salary_Admin
FROM EMP
WHERE Department = 'Admin';


--8. Display total salary of HR department. 
SELECT SUM(Salary) AS Total_Salary_HR
FROM EMP
WHERE Department = 'HR';


--9. Count total number of cities of employee without duplication
SELECT COUNT(DISTINCT City) AS Unique_Cities
FROM EMP;


--10. Count unique departments
SELECT COUNT(DISTINCT Department) AS Unique_Departments
FROM EMP;


--11. Give minimum salary of employee who belongs to Ahmedabad.
SELECT MIN(Salary) AS Min_Salary_Ahmedabad
FROM EMP
WHERE City = 'Ahmedabad';


--12. Find city wise highest salary
SELECT City, MAX(Salary) AS Highest_Salary
FROM EMP
GROUP BY City;


--13. Find department wise lowest salary.
SELECT Department, MIN(Salary) AS Lowest_Salary
FROM EMP
GROUP BY Department;


--14. Display city with the total number of employees belonging to each city.
SELECT City, COUNT(*) AS Total_Employees_City
FROM EMP
GROUP BY City;


--15. Give total salary of each department of EMP table.
SELECT Department, SUM(Salary) AS Total_Salary_Department
FROM EMP
GROUP BY Department;


--16. Give average salary of each department of EMP table without displaying the respective department name.
SELECT AVG(Salary) AS Average_Salary_Department
FROM EMP
GROUP BY Department;


--17. Count the number of employees for each department in every city
SELECT Gender, SUM(Salary) AS Total_Salary_Gender
FROM EMP
GROUP BY Gender;


--18. Calculate the total salary distributed to male and female employees.
SELECT Gender, SUM(Salary) AS Total_Salary_Gender
FROM EMP
GROUP BY Gender;


--19. Give city wise maximum and minimum salary of female employees
SELECT City, MAX(Salary) AS Max_Salary_Female, MIN(Salary) AS Min_Salary_Female
FROM EMP
WHERE Gender = 'Female'
GROUP BY City;


--20. Calculate department, city, and gender wise average salary.
SELECT Department, City, Gender, AVG(Salary) AS Avg_Salary
FROM EMP
GROUP BY Department, City, Gender;


--PART B
--1. Count the number of employees living in Rajkot
SELECT COUNT(*) AS Employees_in_Rajkot
FROM EMP
WHERE City = 'Rajkot';


--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE
SELECT MAX(Salary) - MIN(Salary) AS DIFFERENCE
FROM EMP;


--3. Display the total number of employees hired before 1st January, 1991
SELECT COUNT(*) AS Employees_Before_1991
FROM EMP
WHERE JoiningDate < '1991-01-01';


--PART C
--1. Count the number of employees living in Rajkot or Baroda
SELECT COUNT(*) AS Employees_in_Rajkot_or_Baroda
FROM EMP
WHERE City IN ('Rajkot', 'Baroda');


--2. Display the total number of employees hired before 1st January, 1991 in IT department
SELECT COUNT(*) AS IT_Employees_Before_1991
FROM EMP
WHERE Department = 'IT' AND JoiningDate < '1991-01-01';


--3. Find the Joining Date wise Total Salaries.
SELECT JoiningDate, SUM(Salary) AS Total_Salary
FROM EMP
GROUP BY JoiningDate;


--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
SELECT Department, City, MAX(Salary) AS Max_Salary
FROM EMP
WHERE City LIKE 'R%'
GROUP BY Department, City;


--Queries on SALES_DATA Table
--PART A
--1. Display Total Sales Amount by Region.
SELECT Region, SUM(Sales_Amount) AS Total_Sales
FROM SALES_DATA
GROUP BY Region;


--2. Display Average Sales Amount by Product
SELECT Product, AVG(Sales_Amount) AS Avg_Sales
FROM SALES_DATA
GROUP BY Product;


--3. Display Maximum Sales Amount by Year.
SELECT Year, MAX(Sales_Amount) AS Max_Sales
FROM SALES_DATA
GROUP BY Year;


--4. Display Minimum Sales Amount by Region and Year.
SELECT Region, Year, MIN(Sales_Amount) AS Min_Sales
FROM SALES_DATA
GROUP BY Region, Year;


--5. Count of Products Sold by Region
SELECT Region, COUNT(Product) AS Product_Count
FROM SALES_DATA
GROUP BY Region;


--6. Display Sales Amount by Year and Product
SELECT Year, Product, SUM(Sales_Amount) AS Total_Sales
FROM SALES_DATA
GROUP BY Year, Product;


--7. Display Regions with Total Sales Greater Than 5000. 
SELECT Region, SUM(Sales_Amount) AS Total_Sales
FROM SALES_DATA
GROUP BY Region
HAVING SUM(Sales_Amount) > 5000;


--8. Display Products with Average Sales Less Than 10000.
SELECT Product, AVG(Sales_Amount) AS Avg_Sales
FROM SALES_DATA
GROUP BY Product
HAVING AVG(Sales_Amount) < 10000;


--9. Display Years with Maximum Sales Exceeding 500
SELECT Year, MAX(Sales_Amount) AS Max_Sales
FROM SALES_DATA
GROUP BY Year
HAVING MAX(Sales_Amount) > 500;


--10. Display Regions with at Least 3 Distinct Products Sold.
SELECT Region, COUNT(DISTINCT Product) AS Distinct_Products
FROM SALES_DATA
GROUP BY Region
HAVING COUNT(DISTINCT Product) >= 3;


--11. Display Years with Minimum Sales Less Than 1000
SELECT Year, MIN(Sales_Amount) AS Min_Sales
FROM SALES_DATA
GROUP BY Year
HAVING MIN(Sales_Amount) < 1000;


--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount.
SELECT Region, SUM(Sales_Amount) AS Total_Sales
FROM SALES_DATA
WHERE Year = 2023
GROUP BY Region
ORDER BY Total_Sales;


--13. Find the Region Where 'Mobile' Had the Lowest Total Sales Across All Years.
SELECT Region, SUM(Sales_Amount) AS Mobile_Sales
FROM SALES_DATA
WHERE Product = 'Mobile'
GROUP BY Region
ORDER BY Mobile_Sales;


--14. Find the Product with the Highest Sales Across All Regions in 2023
SELECT Product, SUM(Sales_Amount) AS Total_Sales
FROM SALES_DATA
WHERE Year = 2023
GROUP BY Product
ORDER BY Total_Sales DESC;


--15. Find Regions Where 'TV' Sales in 2023 Were Greater Than 1000.
SELECT Region, SUM(Sales_Amount) AS TV_Sales
FROM SALES_DATA
WHERE Product = 'TV' AND Year = 2023
GROUP BY Region
HAVING SUM(Sales_Amount) > 1000;


--Part – B
--1. Display Count of Orders by Year and Region, Sorted by Year and Region.
SELECT Year, Region, COUNT(*) AS Order_Count
FROM SALES_DATA
GROUP BY Year, Region
ORDER BY Year, Region;


--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region.
SELECT Region, MAX(Sales_Amount) AS Max_Sales
FROM SALES_DATA
GROUP BY Region
HAVING MAX(Sales_Amount) > 1000
ORDER BY Region;


--3. Display Years with Total Sales Amount Less Than 10000, Sorted by Year Descending. 
SELECT Year, SUM(Sales_Amount) AS Total_Sales
FROM SALES_DATA
GROUP BY Year
HAVING SUM(Sales_Amount) < 10000
ORDER BY Year DESC;


--4. Display Top 3 Regions by Total Sales Amount in Year 2024.
SELECT Region, SUM(Sales_Amount) AS Total_Sales
FROM SALES_DATA
WHERE Year = 2024
GROUP BY Region
ORDER BY Total_Sales DESC
LIMIT 3;


--5. Find the Year with the Lowest Total Sales Across All Regions.
SELECT Year, SUM(Sales_Amount) AS Total_Sales
FROM SALES_DATA
GROUP BY Year
ORDER BY Total_Sales
LIMIT 1;


--PART C
--1. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name
SELECT Product, AVG(Sales_Amount) AS Avg_Sales
FROM SALES_DATA
GROUP BY Product
HAVING AVG(Sales_Amount) BETWEEN 1000 AND 2000
ORDER BY Product;


--2. Display Years with More Than 1 Orders from Each Region.
SELECT Year, Region, COUNT(*) AS Orders
FROM SALES_DATA
GROUP BY Year, Region
HAVING COUNT(*) > 1;


--3. Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending.
SELECT Region, AVG(Sales_Amount) AS Avg_Sales
FROM SALES_DATA
WHERE Year = 2023
GROUP BY Region
HAVING AVG(Sales_Amount) > 1500
ORDER BY Avg_Sales DESC;


--4. Find out region wise duplicate product.
SELECT Region, Product, COUNT(*) AS Dup_Count
FROM SALES_DATA
GROUP BY Region, Product
HAVING COUNT(*) > 1;


--5. Find out year wise duplicate product.
SELECT Year, Product, COUNT(*) AS Dup_Count
FROM SALES_DATA
GROUP BY Year, Product
HAVING COUNT(*) > 1;
