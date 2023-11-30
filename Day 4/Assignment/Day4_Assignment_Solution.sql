-- Note: please do not use any functions which are not taught in the class. you need to solve the questions only with the concepts 
-- that have been discussed so far.

SELECT * FROM orders;

-- 1- write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909
UPDATE orders 
SET city=NULL
WHERE order_id IN ('CA-2020-161389','US-2021-156909');


UPDATE orders 
SET city=NULL 
WHERE order_id = 'CA-2020-161389' AND order_id ='US-2021-156909';

-- 2- write a query to find orders where city is null (2 rows)
SELECT * FROM orders
WHERE city IS NULL;

-- 3- write a query to get total profit, first order date and latest order date for each category
SELECT category,SUM(profit) AS TOTAL_PROFIT,MIN(order_date) AS FIRST_ORDER,MAX(order_date) AS LATEST_ORDER
FROM orders
GROUP BY category;

-- 4- write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category
SELECT sub_category,AVG(profit) AS AVG_PROFIT,(MAX(profit))/2 AS MAX_PROFIT
FROM orders
GROUP BY sub_category
HAVING AVG(profit) > (MAX(profit))/2;

-- 5- create the exams table with below script;
create table exams (student_id int, subject varchar(20), marks int);

insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);

-- write a query to find students who have got same marks in Physics and Chemistry.
SELECT * FROM exams;

SELECT student_id,marks,COUNT(*) AS GRP_CNT
FROM exams
WHERE subject IN ('Physics','Chemistry')
GROUP BY student_id,marks
HAVING COUNT(*)=2;

-- 6- write a query to find total number of products in each category.
SELECT category,COUNT(product_name) AS TOTAL_PRODUCTS
FROM orders
GROUP BY category;

-- 7- write a query to find top 5 sub categories in west region by total quantity sold
SELECT TOP 5 sub_category,SUM(quantity) AS TOTAL_QUANTITY
FROM orders
WHERE region='west'
GROUP BY sub_category
ORDER BY TOTAL_QUANTITY DESC;

-- 8- write a query to find total sales for each region and ship mode combination for orders in year 2020
SELECT region,ship_mode,SUM(sales) AS TOTAL_SALES
FROM orders
WHERE order_date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY region,ship_mode;

SELECT region,ship_mode,SUM(sales) AS TOTAL_SALES
FROM orders
WHERE YEAR(order_date) = '2020'
GROUP BY region,ship_mode;
