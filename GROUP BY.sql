--Q1.Display each region and its total sales.
SELECT region,SUM(sales) 
FROM orders_data GROUP BY
region;
--Q2.Display each category and its average profit.
SELECT category,AVG(Profit) FROM 
orders_data GROUP BY category;
--Q3.Display each city and its number of rows, sorted from highest to lowest count.
SELECT city,COUNT(*)  AS number_of_rows FROM orders_data
GROUP BY city ORDER BY number_of_rows DESC; 
--Q4.Consider only records from the West region. Display each category and its total quantity sold
SELECT region,Category,SUM(quantity) FROM orders_data
WHERE region ='West' GROUP BY category,region;
--Q5.Display each region and category combination and its total sales. Include only groups with total sales greater than 500.
SELECT region,category,SUM(sales) AS total_sales FROM orders_data
GROUP BY region,category HAVING  SUM(sales)>500;
