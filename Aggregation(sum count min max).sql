USE PracticeSQL;

SELECT * FROM orders_data;


--Q1.Count the total number of rows in the table.
SELECT COUNT(*) as total_number_of_rows FROM orders_data;
--Q2.Find the total sales across all records.
SELECT SUM(sales) AS total_sales FROM orders_data;
--Q3.Find the average profit across all records.
SELECT SUM(profit)/COUNT(*) as avg_profit FROM orders_data;

SELECT AVG(profit) AS avg_profit FROM orders_data;
--Q4.Find the lowest and highest sales values in one query.
SELECT MAX(Sales) AS Higesht_sales ,MIN(Sales) AS Lowest_sales FROM orders_data;
--Q5.Find the total quantity sold in the West region.
SELECT SUM(quantity) as Total_Quantity FROM orders_data WHERE region='West';

---Q6.Display each category and its total sales.
SElECT category, SUM(Sales) AS Total_Sales FROM orders_data GROUP BY category;
---Q7.Display each region and its average profit, sorted from highest to lowest average profit.
SELECT region ,AVG(Profit) AS AVG_Profit FROM orders_data GROUP BY region ORDER BY AVG_Profit DESC;
---Q8.Display each category and its row count. Include only categories with more than 10 rows.
SELECT category ,COUNT(category) FROM orders_data GROUP BY category HAVING COUNT(*)>10;
---Q9.Consider only records where sales exceed 100. Display each region and its total profit, keeping only regions with positive total profit.
SELECT region,SUM(profit)as total_profit FROM orders_data WHERE sales>100 GROUP BY region HAVING  SUM(profit)>0; 
---Q10.Display the top 3 cities by total sales, including only cities with total sales greater than 500.
SELECT TOP 3 city, SUM(sales)as Total_Sales FROM orders_data GROUP BY city HAVING SUM(Sales)>500 ORDER BY Total_Sales DESC;