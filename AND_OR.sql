--Q1.Display records where region is 'West' AND sales are greater than 500.
SELECT * FROM orders_data
WHERE region='West' AND sales>500;

--Q2.Display records where category is 'Furniture' AND profit is less than 0.
SELECT * FROM orders_data
WHERE category='Furniture' AND profit<0;
--Q3.Display records where region is 'South' OR region is 'Central'.
SELECT * FROM  orders_data WHERE region='South' OR region='Central';
--Q4.Display records where sales are greater than 1,000 OR profit is greater than 200.
SELECT * FROM orders_data WHERE Sales >1000 OR profit>200;
--Q5.Display records where category is 'Technology', sales exceed 500, AND quantity is at least 3.
SELECT * FROM orders_data WHERE category='Technology' AND sales>500 AND quantity>=3;
--Q6.Display records where region is either 'West' OR 'South', AND sales exceed 300.
SELECT * FROM orders_data WHERE sales>300 AND(region='West' OR region='South');

--Q7.Display records where category is 'Furniture' AND profit exceeds 100, OR category is 'Technology' AND sales exceed 1,000.
SELECT * FROM orders_data WHERE (category='Furniture' AND profit>100)  OR (category='Technology' AND sales>1000);

--Q8.Display records where order_date is on or after '2020-01-01' AND before '2021-01-01', AND region is either 'West' OR 'Central'. Sort by sales from highest to lowest.
SELECT * FROM orders_data Where order_date>='2020-01-01' AND order_date<'2021-01-01' AND (region='West' OR region='Central') ORDER  BY sales DESC;