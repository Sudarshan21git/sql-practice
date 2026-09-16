SELECT * FROM dbo.orders_data;


SELECT * FROM orders_data WHERE ship_date BETWEEN '2019-10-11' AND '2020-11-08';



SELECT * FROM orders_data WHERE region IN('West','South','Central');

SELECT customer_name FROM orders_data  ORDER BY customer_name ASC;
-- Q1: Display all records sorted by sales from lowest to highest.
SELECT * FROM orders_data ORDER BY sales ASC;
-- Q2.Display customer_name, city, and profit, sorted by profit from highest to lowest.
SELECT customer_name,city,profit From orders_data ORDER BY
profit DESC;
-- Q3.Display all records sorted by order_date from newest to oldest.
SELECT * FROM orders_data ORDER BY order_date DESC;
--Q4.Display records where category is 'Furniture', sorted by sales from highest to lowest.
SELECT * FROM orders_data WHERE category='Furniture' ORDER BY  sales DESC;

--Q5.Display all records sorted by region alphabetically (A–Z). Within the same region, sort by sales from highest to lowest.
SELECT * FROM orders_data ORDER BY  region ASC,sales DESC;
