USE PracticeSQL;

SELECT * FROM orders_data;

--Q1.Display records from West or South where sales exceed 300. Sort by sales from highest to lowest.
SELECT * FROM orders_data
WHERE region IN('West','South') AND sales>300
ORDER BY sales DESC;

--Q2.Display records dated on or after 1 January 2020 and before 1 January 2021, where category is Technology and quantity is at least 3.
SELECT * FROM orders_data
WHERE order_date >='2020-01-01'
AND order_date <'2021-01-01' AND
category ='Technology'
AND quantity>=3;

--Q3.Display the top 5 records with the highest profit, excluding records where profit is NULL.
SELECT TOP 5 * FROM orders_data
WHERE profit IS NOT NULL
ORDER BY Profit desc;

--Q4.In one query, display the total row count, non-NULL profit count, total sales and average profit for the whole table.
SELECT COUNT(*) AS Total_Row 
,COUNT(profit) AS Total_profit_count,SUM(sales) AS Total_Sales,
AVG(profit) AS AVG_Profit
FROM orders_data;


--Q5.Consider only records from West. Display each category and its total quantity, keeping only categories with total quantity greater than 20.
SELECT category,SUM(quantity) AS Total_Quantity
FROM orders_data
WHERE region='West'
GROUP BY category
HAVING SUM(quantity)>20;

--Q6.Consider only records where sales exceed 100. Display each region and its total profit, keeping only positive total profits. Sort by total profit from highest to lowest.
SELECT region,SUM(profit) AS total_Profit
FROM orders_data
WHERE sales>100
GROUP BY region
HAVING SUM(profit)>0
ORDER BY total_Profit DESC;

--Q7.Display each region and category combination and its total sales. Include only groups with total sales greater than 500, sorted from highest to lowest total sales.
SELECT category,region,SUM(sales) AS Total_Sales
FROM orders_data 
GROUP BY category,region
HAVING SUM(sales)>500
ORDER BY Total_Sales DESC;

 
--Q8.Display the top 3 cities by total sales, showing each city’s row count and total sales. Include only cities with at least 2 rows and total sales greater than 500. Sort by total sales from highest to lowest.
SELECT TOP 3 city,SUM(sales) AS total_sales,COUNT(*) AS City_Count
FROM orders_data 
GROUP BY 
city
HAVING SUM(sales)>500 AND COUNT(*)>=2
ORDER BY total_sales DESC;

