USE PracticeSQL;

SELECT  * FROM orders_data;

--Q1.Display each region and its total sales. Include only regions with total sales greater than 1,000.
SELECT region,SUM(Sales) AS total_sales FROM orders_data
GROUP BY region 
HAVING SUM(Sales)>1000;


--Q2.Display each category and its average profit. Include only categories with average profit greater than 0.
SELECT category,AVG(Profit) as avegrage_profit FROM orders_data
GROUP BY category HAVING AVG(Profit)>0;

--Q3.Display each city and its row count. Include only cities with more than 2 rows.
SELECT city,COUNT(*) AS Row_Count FROM orders_data 
GROUP BY city Having COUNT(*)>2;

--Q4.Display each category and its total quantity sold. Include only categories with total quantity greater than 20
SELECT category,SUM(quantity) AS total_quantity FROM orders_data 
GROUP BY category HAVING SUM(quantity) >20;


--Q5.Consider only records from the West region. Display each category and its total sales, keeping only categories with total sales greater than 500.
SELECT region,SUM(Sales) AS Total_Profit FROM orders_data
WHERE region='West' GROUP BY region 
HAVING SUM(Sales)>500;

--Q6.Consider only records where sales exceed 100. Display each region and its total profit, keeping only regions with positive total profit.
SELECT  region,SUM(Profit) AS Total_Profit FROM orders_data
WHERE sales>100 GROUP BY region
HAVING SUM(Profit) >0;


--Q7.Display each region and category combination and its total sales. Include only groups with total sales greater than 500, sorted from highest to lowest total sales.
SELECT region,category,SUM(Sales) AS Total_Sales 
FROM orders_data GROUP BY region,category
HAVING SUM(Sales)>500 ORDER BY
 Total_Sales DESC;

 --Q8.Display the top 3 cities by total sales. Include only cities with at least 2 rows and total sales greater than 500. Sort by total sales from highest to lowest.
 SELECT TOP 3 city,SUM(Sales) AS total_Sales FROM orders_data
 GROUP BY city HAVING SUM(sales)>500
 ORDER BY total_Sales DESC;