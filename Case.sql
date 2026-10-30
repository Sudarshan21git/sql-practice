use PracticeSQL;
select * from orders_data;
SELECT * FROM returns_data;

--Q1.Display order_id, customer_name, sales, and a new column called sales_category.
--Sales greater than 500 ? 'High Sales'
--Sales greater than 100 ? 'Medium Sales'
--Otherwise ? 'Low Sales'

SELECT order_id,customer_name,
sales,
CASE
WHEN sales>500 THEN 'High Sales'
WHEN sales>100 THEN 'Medium Sales'
else 'Low Sales' END AS sales_category
FROM orders_data;


--Q2.Profit Classification
--Display order_id, profit, and profit_status.
--Profit greater than 0 ? 'Profit'
-- Profit less than 0 ? 'Loss'
-- Otherwise ? 'Break Even'

SELECT order_id,profit,
CASE
WHEN profit>0 THEN 'Profit'
WHEN profit<0 THEN 'Loss'
ELSE 'Break Even' END AS profit_status
FROM orders_data;

--Q3.Quantity Classification
--Display product_id, quantity, and quantity_status.
-- Quantity greater than or equal to 5 → 'Bulk Order'
-- Quantity between 3 and 4 → 'Medium Order'
-- Otherwise → 'Small Order'

SELECT product_id,quantity,
CASE
WHEN quantity>=5 THEN 'Bulk Order'
WHEN  quantity BETWEEN 3 AND 4 THEN 'Medium Order'
ELSE 'Small Order' END AS quantity_status
FROM  orders_data;

--Q4.Region Classification
--Display customer_name, region, and region_group.
--Region is 'West' → 'Western Region'
--Region is 'East' → 'Eastern Region'
--Otherwise → 'Other Region'

SELECT customer_name,region,
CASE
WHEN region ='West' THEN 'Western Region'
WHEN  region='East' Then 'Eastern Region'
ELSE 'Other Region' END AS region_group
FROM orders_data;


--Q5. Sales and Profit Evaluation

--Display order_id, sales, profit, and business_status.
--Sales greater than 500 and profit greater than 0 → 'High Value Profitable'
-- Sales greater than 500 and profit less than 0 → 'High Value Loss'
--Otherwise → 'Other Orders'

SELECT order_id,sales,profit ,
CASE
WHEN sales>500 AND profit>0 THEN 'High Value Profitable'
WHEN sales>500 AND profit<0 THEN 'High Value Loss'
ELSE 'other Orders'
END AS busineess_status 
FROM orders_data;


--Q6.Discount/Profit Evaluation

--Display customer_name, sales, profit, and profit_category.
--Profit greater than 100 → 'High Profit'
--Profit between 0 and 100 → 'Low Profit'
--Profit below 0 → 'Loss Making'

SELECT customer_name,sales,profit,
CASE 
WHEN profit>100 THEN 'High Profit'
WHEN profit BETWEEN 0 AND 100  THEN 'Low Profit'
ELSE 'Loss Making' END AS profit_category
FROM orders_data;


--Q7.Product Category Classification

--Display product_id, category, and category_group.
--'Technology' → 'Tech Products'
--'Furniture' → 'Home Products'
--'Office Supplies' → 'Office Products'



SELECT product_id,category,
CASE
WHEN category='Technology' THEN 'Tech Products'
WHEN category='Furniture' THEN 'Home Products'
ELSE 'Office Products'
END AS category_group
From orders_data;

--Q8. Shipping Time Classification

--Display order_id, order_date, ship_date, and shipping_status.
--Shipped within 2 days → 'Fast Shipping'
--Shipped within 5 days → 'Normal Shipping'
--More than 5 days → 'Slow Shipping'

SELECT order_id,order_date,ship_date,
CASE
WHEN DATEDIFF(day,order_date,ship_date)<=2 THEN 'Fast Shipping'
WHEN DATEDIFF(day,order_date,ship_date)<=5 THEN 'Normal Shipping'
ELSE 'Slow Shipping' END AS Shipping_status
FROM orders_data ;


--Q9. Customer Order Priority

--Display customer_name, sales, profit, and order_priority.
--Sales greater than 1000 and profit greater than 100 → 'Priority 1'
--Sales greater than 500 → 'Priority 2'
-- Otherwise → 'Priority 3'

SELECT customer_name,sales,profit,
CASE
WHEN sales >1000 AND profit>100 THEN 'Priority 1'
WHEN sales>500 THEN 'Priority 2'
ELSE 'Priority 3'
 END AS order_priority
FROM orders_data;


--Q10. Overall Business Performance

--Display order_id, category, sales, quantity, profit, and performance_status.
--Profit is negative → 'Loss'
---Otherwise, sales greater than 500 and quantity greater than 3 → 'Strong Performance'
--Otherwise, sales greater than 100 → 'Average Performance'
--Otherwise → 'Low Performance'

SELECT  order_id,category,sales,quantity,profit,
CASE
WHEN profit <0 THEN 'Loss'
WHEN sales >500 AND quantity>3 THEN 'Strong Performance'
WHEN sales >100 THEN 'Average Performance'
ELSE 'Low Performance'
END performance_status

FROM orders_data;


--GROUP BY WITH CASE

--Q1. Count orders by sales category — Easy
--Display sales_category and total_orders.

--Classify sales as:
--Greater than 500 → 'High Sales'
--Greater than 100 → 'Medium Sales'
--Otherwise → 'Low Sales'

SELECT 
CASE
WHEN sales >500 THEN 'High Sales'
WHEN sales>100 THEN 'Medium Sales'
ELSE 'Low Sales'
END AS Sales_Caetgory,
COUNT(*) AS Total_Orders
FROM orders_data
GROUP BY
CASE 
WHEN sales >500 THEN 'High Sales'
WHEN sales>100 THEN 'Medium Sales'
ELSE 'Low Sales'
END;

--Q2. Total sales by profit status 
--Display profit_status and total_sales.
--Classify profit as:
--Greater than 0 → 'Profit'
--Less than 0 → 'Loss'
--Otherwise → 'Break Even'


SELECT 
CASE 
WHEN profit>0 THEN 'Profit'
WHEN profit<0 THEN 'Loss'
ElSE 'Break Even'
END AS Profit_status,
SUM(sales) AS total_sales
FROM orders_data
GROUP BY 
CASE
WHEN profit>0 THEN 'Profit'
WHEN profit<0 THEN 'Loss'
ElSE 'Break Even'
END;


--Q3. Average profit by quantity category — Medium
--Display quantity_category and average_profit.

--Classify quantity as:
--Greater than or equal to 5 → 'Bulk Order'
--Between 3 and 4 → 'Medium Order'
--Otherwise → 'Small Order'


SELECT 
CASE 
WHEN quantity >=5 THEN 'Bulk Order'
WHEN quantity Between 3 AND 4 THEN 'Medium Order'
ELSE 'Small Order'
END AS Quantity_category,AVG(profit) AS Average_profit
FROM orders_data
GROUP BY 
CASE
WHEN quantity >=5 THEN 'Bulk Order'
WHEN quantity Between 3 AND 4 THEN 'Medium Order'
ELSE 'Small Order'
END;




--Q4. Count orders by performance — Medium
--Display performance_status and total_orders.

--Classify each row as:
--- Profit less than 0 → 'Loss'
- --Otherwise, sales greater than 500 and quantity greater than 3 → 'Strong Performance'
--Otherwise, sales greater than 100 → 'Average Performance'
--Otherwise → 'Low Performance'
--
--Count the rows in each performance category. Keep the conditions in the given order.
SELECT 
CASE
WHEN profit<0 THEN 'Loss'
WHEN sales>500 AND quantity>3 THEN 'Strong Performance'
WHEN sales >100 THEN 'Average Performance'
ELSE 
'Low Performance'
END AS Performance_status,
COUNT(*) AS Total_Orders
FROM orders_data
GROUP BY
CASE
WHEN profit<0 THEN 'Loss'
WHEN sales>500 AND quantity>3 THEN 'Strong Performance'
WHEN sales >100 THEN 'Average Performance'
ELSE 
'Low Performance'
END
;

--Q5. Total profit by sales category — Challenge
--Display sales_category and total_profit.

--Classify sales as:
--Greater than 1,000 → 'Very High Sales'
--Greater than 500 → 'High Sales'
--Greater than 100 → 'Medium Sales'
--Otherwise → 'Low Sales'
--Calculate the total profit for each sales category and sort the results by total_profit from highest to lowest.
SELECT 
CASE 
WHEN sales>1000 THEN 'Very High Sales'
WHEN sales>500 THEN 'High Sales'
WHEN sales>100 THEN 'Medium Sales'
ELSE 'Low Sales' END AS Sales_Category,
SUM(profit) AS total_profit
FROM orders_data
GROUP BY
CASE 
WHEN sales>1000 THEN 'Very High Sales'
WHEN sales>500 THEN 'High Sales'
WHEN sales>100 THEN 'Medium Sales'
ELSE 'Low Sales' 
END
ORDER BY total_profit DESC;




---Join and case

--Display order_id, customer_name, and return_status.

--Use LEFT JOIN to combine orders_data with returns_data.
--If a matching order exists in returns_data → 'Returned'
--Otherwise → 'Not Returned'
SELECT O.order_id,O.customer_name,R.return_reason,

CASE
WHEN O.order_id=R.order_id THEN 'Returned'
ELSE 'Not Returned'
END AS Return_Status
FROM orders_data AS O
LEFT JOIN returns_data AS R
ON O.order_id=R.order_id;


--Q2. Classify orders by return reason — Easy
--Display order_id, customer_name, return_reason, and return_category.

-- LEFT JOIN.
---If return_reason is 'Bad Quality' → 'Quality Issue'
---If return_reason is 'Wrong Item' → 'Order Issue'
---Otherwise → 'Other / Not Returned'

SELECT O.order_id,O.customer_name,R.return_reason,
CASE
WHEN R.return_reason='Bad Quality' THEN 'Quality Issue'
WHEN R.return_reason='Wrong Item' THEN 'Order Issue'
ELSE 'Other/Not Returned' 
END AS return_category

FROM orders_data AS O
LEFT JOIN returns_data AS R
ON O.order_id=R.order_id;

--Q3. Classify sales for returned and non-returned orders — Medium
--Display order_id, customer_name, sales, and order_status.

--Use LEFT JOIN.
---If the order was returned and sales > 500 → 'High Value Returned'
---If the order was returned and sales <= 500 → 'Low Value Returned'
---Otherwise → 'Not Returned'



SELECT O.order_id,O.customer_name,O.sales,
CASE
WHEN O.order_id=R.order_id AND sales>500 THEN 'High Value Returned'
WHEN O.order_id=R.order_id AND sales<=500 THEN 'Low Value Returned'
ELSE 'Not Returned' END AS Order_Status


FROM orders_data AS O
LEFT JOIN returns_data AS R
ON O.order_id=R.order_id;

--Q4.Find orders with no matching return — Medium
--Display order_id, customer_name, and return_status.

--Use LEFT JOIN and CASE WHEN to label each row as:
--No matching record in returns_data → 'No Return Record'
--Matching record in returns_data → 'Return Record Found'

SELECT O.order_id,O.customer_name,
CASE
WHEN O.order_id=R.order_id THEN 'Return Record Found'
ELSE 'NO Return Record Found'
END AS 'Return_Status'
FROM orders_data AS O
LEFT JOIN returns_data AS R
ON O.order_id=R.order_id;

--Q5. Classify returned orders by sales and return reason — Challenge
--Display order_id, customer_name, sales, return_reason, and return_category.

--Use LEFT JOIN and these rules in the given order:
--1. A matching return record exists and sales > 500 → 'High Value Return'
--2. A matching return record exists and sales <= 500 → 'Low Value Return'
--3. Otherwise → 'Not Returned'

SELECT O.order_id,O.customer_name,O.sales,R.return_reason,
CASE
WHEN O.order_id=R.order_id AND O.sales>500 THEN 'High Valye Return'
WHEN O.order_id=R.order_id AND O.sales<=500 THEN'Low Vlaue Return'
ELSE 'Not Returned'
END AS Return_category
FROM orders_data AS O
LEFT JOIN returns_data AS R
ON O.order_id=R.order_id;




SELECT * FROM returns_data;