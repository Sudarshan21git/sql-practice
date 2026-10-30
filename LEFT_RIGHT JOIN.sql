USE PracticeSQL;

SELECT * FROM orders_data;
SELECT * FROM returns_data;

--Q1.Display all orders with their return details, including orders that have not been returned.
SELECT * FROM orders_data AS O
LEFT JOIN returns_data AS R
ON O.order_id=R.order_id;


--Q2.Display order_id, customer_name and return_reason for all orders, including those without a matching return.
SELECT O.order_id,O.customer_name,R.return_reason FROM orders_data AS O
LEFT JOIN returns_data AS R
ON O.order_id=R.order_id;

--Q3.Display only orders that have no matching record in returns_data.
SELECT * FROM orders_data AS O
LEFT JOIN returns_data AS R
ON O.order_id=R.order_id
WHERE R.order_id IS NULL;

--Q4.Display all West-region orders with their return reasons, including orders without a matching return.
SELECT * FROM orders_data AS O
LEFT JOIN returns_data AS R
ON O.order_id=R.order_id
WHERE O.region='West';

--Q5.Display all orders where sales exceed 500, together with their return reasons. Include orders without returns and sort by sales from highest to lowest.
SELECT * FROM orders_data AS O 
LEFT JOIN returns_data AS R 
ON O.order_ID=R.order_id
WHERE O.sales>500
ORDER BY O.sales DESC;


--RIGHT JOIN

--Q6.Using returns_data on the left and orders_data on the right, display all orders with any matching return details.'
SELECT * FROM returns_data AS R
RIGHT JOIN orders_data AS O
ON O.order_id=R.order_id;

--Q7.Using orders_data on the left and returns_data on the right, display all return records with the matching customer names, including returns without a matching order.
SELECT O.customer_name FROM orders_data AS O
RIGHT JOIN returns_data AS R ON
O.order_id=R.order_id;


SELECT * FROM orders_data ;
SELECT * FROM returns_data;


--Q8.Using orders_data on the left and returns_data on the right, find return records that have no matching order. Display the return table’s order_id and return_reason.

SELECT R.order_id, R.return_reason
FROM orders_data AS O
RIGHT JOIN returns_data AS R
ON O.order_id = R.order_id
WHERE O.order_id IS NULL;

--Q9.Using returns_data on the left and orders_data on the right, display all Technology orders with their return reasons, including orders without returns.
SELECT O.order_id,O.category,R.return_reason FROM returns_data AS R
RIGHT JOIN orders_data AS O
ON O.order_id=R.order_id
WHERE O.category='Technology';
