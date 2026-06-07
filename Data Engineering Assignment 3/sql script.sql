 -- Load the dataset
 select count(*) AS Total_Rows
 FROM superstore_raw;
 
 -- view Sample Data
select * from superstore_raw
 limit 10;
 describe superstore_raw;
 
 -- Create Customers Table
CREATE TABLE customers AS
 SELECT DISTINCT
   `Customer ID`,
  `Customer Name`,
   Segment
 FROM superstore_raw;
 show tables;
use superstore_db;
 show tables;
 select * from customers limit 10;
 
 -- Create Products Table 
  CREATE TABLE products AS
SELECT DISTINCT
    `Product ID`,
    `Product Name`,
    Category,
    `Sub-Category`
FROM superstore_raw; 
SELECT * FROM products LIMIT 10; 

-- Create Orders Table
CREATE TABLE orders AS
SELECT distinct
    `Order ID`,
    `Customer ID`,
    `Product ID`,
    Sales,
    Quantity,
    Profit,
    `Order Date`,
    Region
FROM superstore_raw; 
SELECT * FROM orders LIMIT 10; 

-- Count records in new tables
 SELECT COUNT(*) FROM customers; 
 SELECT COUNT(*) FROM products; 
 SELECT COUNT(*) FROM orders; 
 
 -- Above Average Sales
 SELECT *
FROM orders
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM orders
); 

-- Highest order per customers
SELECT *
FROM orders o
WHERE Sales =
(
    SELECT MAX(Sales)
    FROM orders
    WHERE `Customer ID` = o.`Customer ID`
); 

-- CTE - Total Sales per Customers
WITH customer_sales AS
(
    SELECT
        `Customer ID`,
        SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY `Customer ID`
) 

-- Window Function - Row_Number
SELECT *
FROM customer_sales
ORDER BY Total_Sales DESC; 
SELECT
    `Customer ID`,
    Sales,
    ROW_NUMBER() OVER
    (
        PARTITION BY `Customer ID`
        ORDER BY Sales DESC
    ) AS Row_Num
FROM orders; 

-- Window Function - Rank
SELECT
    `Customer ID`,
    SUM(Sales) AS Total_Sales,
    RANK() OVER
    (
        ORDER BY SUM(Sales) DESC
    ) AS Customer_Rank
FROM orders
GROUP BY `Customer ID`;

   WITH customer_sales AS
(
    SELECT
        `Customer ID`,
        SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY `Customer ID`
) 

-- Final query (Join + CTE + Window Function)
 WITH customer_sales AS
(
    SELECT
        `Customer ID`,
        SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY `Customer ID`
)
SELECT
    c.`Customer ID`,
    c.`Customer Name`,
    cs.Total_Sales,
    RANK() OVER (
    ORDER BY cs.Total_Sales DESC) AS Customer_Rank
FROM customers c
JOIN customer_sales cs
ON c.`Customer ID` = cs.`Customer ID`; 

 -- Top Customers
SELECT
    `Customer ID`,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY `Customer ID`
ORDER BY Total_Sales DESC
LIMIT 10;  

-- Customers with one order
SELECT
    `Customer ID`,
    COUNT(`Order ID`) AS Order_Count
FROM orders
GROUP BY `Customer ID`
HAVING COUNT(`Order ID`) = 1; 

-- Above Average Customers
WITH customer_sales AS
(
    SELECT
        `Customer ID`,
        SUM(Sales) AS Total_Sales
    FROM orders
    GROUP BY `Customer ID`
)
SELECT *
FROM customer_sales
WHERE Total_Sales >
(
    SELECT AVG(Total_Sales)
    FROM customer_sales
); 

-- Low Customers
SELECT
    `Customer ID`,
    SUM(Sales) AS Total_Sales
FROM orders
GROUP BY `Customer ID`
ORDER BY Total_Sales ASC
LIMIT 5;