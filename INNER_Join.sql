USE PracticeSQL;
SELECT * FROM orders_data;
SELECT * FROM returns_data;	

SELECT   * FROM orders_data AS O
JOIN returns_data AS R 
ON O.order_id=R.order_id;


SELECT DISTINCT O.order_id,O.customer_name
FROM orders_data AS O
JOIN returns_data AS R
    ON O.order_id = R.order_id;

--Q1.Display all columns from both tables for orders that have been returned.
	SELECT * FROM orders_data AS O
	INNER JOIN returns_data AS R
	ON O.order_id =R.order_id;

--Q2.Display only order_id, customer_name, and return_reason for returned orders.
	SELECT O.order_id,O.customer_name,R.return_reason
	FROM orders_data AS O
	JOIN returns_data AS R ON
	R.order_id =O.order_id;


--Q3.Display returned orders where return_reason is 'Wrong Items'.
SELECT * FROM orders_data AS O
JOIN returns_data AS R
ON O.order_id=R.order_id 
WHERE return_reason='Wrong Items';

--Q4.Display returned orders from the West region where profit is negative. Sort by profit from lowest to highest.
SELECT * FROM orders_data
AS O
JOIN returns_data AS R
ON  O.order_id=R.order_id
WHERE O.region='West' AND O.profit<0
ORDER BY O.profit ASC;


--Q5.Display the unique order IDs of returned orders. Each order ID should appear only once
SELECT DISTINCT O.order_id
FROM orders_data AS O
  JOIN  returns_data AS R
  ON O.order_id=R.order_id;

  --Q6.For each return_reason, display the number of matching product rows. Name the count returned_product_rows.

  SELECT COUNT(*) AS returned_product_rows,
  R.return_reason FROM orders_data AS
  O JOIN returns_data AS R ON O.order_id=R.order_id
  GROUP BY R.return_reason;

--Q7.Find the total sales of returned products for each region. Display only regions whose total exceeds 500, sorted by total sales from highest to lowest.
SELECT SUM(O.sales) AS total_Sales ,O.region
FROM orders_data AS O
JOIN  returns_data AS R
ON O.order_id=R.order_id
GROUP BY  O.region
HAVING SUM(O.sales)>500
ORDER BY total_Sales DESC;

--Q8.Display the top 3 returned orders with the highest total sales, considering only orders whose total sales exceed 200. Show order_id, customer_name, total sales, and total quantity. Each order should appear once.
SELECT TOP 3 SUM(O.sales) AS total_sales
,O.order_id,O.customer_name,
SUM(quantity) AS total_quantity 
FROM orders_data AS O
JOIN returns_data AS R ON O.order_id=R.order_id
GROUP BY O.order_id,O.customer_name
HAVING SUM(O.sales)>200
ORDER BY total_sales DESC;


--Q9.Find the top 2 return reasons with the highest number of unique returned orders. Show return_reason, unique order count, and total sales. If the counts are equal, put the reason with higher total sales first.
SELECT TOP 2  R.return_reason,COUNT(DISTINCT O.order_id)  unique_order_count ,SUM(O.sales) AS total_sales
FROM orders_data AS O
JOIN returns_data AS R ON O.order_id=R.order_id
GROUP BY R.return_reason
ORDER BY unique_order_count DESC, total_sales DESC;

--Q10.For each region, calculate the unique returned order count, total sales, and total profit. Display only regions with at least 2 unique returned orders and negative total profit. Sort by total profit from lowest to highest.
SELECT O.region,COUNT(DISTINCT R.order_id) AS Unique_returned_order
,SUM(O.sales) AS total_sales,SUM(O.profit) AS Total_Profit
FROM orders_data AS O
INNER JOIN returns_data AS R
ON O.order_id =R.order_id 
GROUP BY region
HAVING COUNT(DISTINCT R.order_id)>=2 AND SUM(O.profit)<0
ORDER BY Total_Profit ASC;


--Q11.Consider only returned products in Furniture or Technology. For each customer, display customer_name, total sales, total quantity, and total profit. Keep customers whose total sales exceed 200. Sort by total sales from highest to lowest.
SELECT O.customer_name,SUM(O.sales) AS Total_sales,
SUM(O.quantity) AS Total_quantity,SUM(O.profit) AS total_profit
FROM orders_data AS O
INNER JOIN returns_data AS R 
ON O.order_id=R.order_id
WHERE O.category IN('Furniture','Technology')
GROUP BY O.customer_name
HAVING SUM(O.sales)>200
ORDER BY Total_sales DESC;

--Q12.Find returned orders whose total quantity is at least 10 and total sales exceed 200. Show order_id, customer_name, total quantity, and total sales. Each order should appear once. Sort by total quantity descending, then total sales descending.
SELECT O.order_id,O.customer_name,SUM(O.quantity) AS total_quantity,
SUM(O.sales) AS total_sales
FROM orders_data AS O
INNER JOIN returns_data AS R
      ON O.order_id =R.order_id
GROUP BY O.order_id,O.customer_name
HAVING SUM(O.quantity)>=10 AND SUM(O.sales)>200
ORDER BY total_quantity  DESC,total_sales DESC;

---Q13.Consider only returned product rows where profit is greater than 0. Find the top 2 cities by average sales per product row. Show city, product row count, average sales, and total profit. Include only cities with at least 2 qualifying product rows and average sales above 50.

SELECT TOP 2 O.city,COUNT(*) AS Total_Product_Row,
 AVG(O.sales) AS AVG_Sales,SUM(O.profit) AS total_profit
 FROM orders_data AS O
 INNER JOIN returns_data AS R
 ON O.order_id=R.order_id
 WHERE O.profit>0
 GROUP BY O.city
 HAVING COUNT(*)>=2 AND AVG(O.sales)>50
 ORDER BY AVG_Sales DESC;