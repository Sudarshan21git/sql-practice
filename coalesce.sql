
USE PracticeSQL;


--Q1. Replace NULL values
--Display order_id and return_reason from returns_data. If return_reason is NULL, display 'No reason provided'.

SELECT O.order_id,COALESCE(R.return_reason,'No reason Provided') AS Return_Reason

FROM orders_data AS O
LEFT JOIN returns_data AS R
ON O.order_id=R.order_id;
;



--Q2. Provide a fallback
--Display order_id and return_reason. Use COALESCE to return 'Unknown' if return_reason is NULL.


SELECT O.order_id,COALESCE(R.return_reason,'Unknown')AS return_reason FROM orders_data AS O
LEFT JOIN returns_data AS R
 ON O.order_id=R.order_id;


--Q3.Write a SELECT statement that returns the first non-NULL value from NULL, NULL, and 'Available'.

SELECT O.order_id,COALESCE(R.return_reason,NULL,NULL,'Available')AS return_reason FROM orders_data AS O
LEFT JOIN returns_data AS R
 ON O.order_id=R.order_id;

