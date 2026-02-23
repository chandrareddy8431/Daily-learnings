CREATE DATABASE retail_sales_db;
USE retail_sales_db;


SELECT COUNT(*) FROM sales_data;

--1.Total Sales

SELECT SUM(sales) AS total_sales
FROM sales;

--2.Total Profit
SELECT SUM(profit) AS total_profit
FROM sales;

--3.Profit Margin %
SELECT 
    ROUND(SUM(profit) * 100 / SUM(sales), 2) AS profit_margin_pct
FROM sales;

--4.Total Quantity Sold
SELECT SUM(quantity) AS total_quantity
FROM sales;

--— 5.Average Order Value
SELECT 
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM sales;

--6.Sales by Region
SELECT 
    region,
    SUM(sales) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

--7.Sales by Category
SELECT 
    category,
    SUM(sales) AS total_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

---8.Monthly Sales Trend
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sales) AS monthly_sales
FROM sales
GROUP BY month
ORDER BY month;

--9.Top 10 Customers
SELECT 
    customer_name,
    SUM(sales) AS total_sales
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;




