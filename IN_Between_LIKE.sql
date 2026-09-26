USE PracticeSQL;
 SELECT * FROM orders_data;
 --Q1.Display all records where region is West, South or Central.
 SELECT * FROM orders_data
 WHERE region IN('West','South','Central');


 --Q2.Display records where sales are between 200 and 800, including both endpoints.
 SELECT * FROM orders_data
 WHERE sales BETWEEN 200 AND 800;

 --Q3.Display records where customer_name starts with A.
 SELECT * FROM orders_data
 WHERE customer_name LIKE 'A%';

 --Q4.Display records where city contains “York”.
 SELECT * FROM orders_data
 WHERE  city LIKE '%York%';

 --Q5.Display records where category is Furniture or Technology and quantity is between 2 and 5, inclusive.
 SELECT * FROM orders_data
 WHERE category IN('Furniture','Technology')
 AND quantity BETWEEN 2 AND 5;



 --Q6.Display records where customer_name ends with n and region is East or West.
SELECT * FROM orders_data
WHERE customer_name LIKE '%n'
AND region IN('East','West');


--Q7.Display records where the second character of customer_name is a and sales are between 100 and 1,000, inclusive.
SELECT * FROM 
orders_data
WHERE customer_name LIKE '_a%'
AND sales BETWEEN 100 AND 1000;


--Q8.Display the top 5 records by highest sales where region is West or South, profit is between 0 and 200, inclusive, and customer_name contains “an”. Sort by sales from highest to lowest.
SELECT TOP 5 * FROM orders_data
WHERE region IN('West','South')
AND profit BETWEEN 0 AND 200
AND customer_name LIKE '%an%'
ORDER BY sales DESC;
