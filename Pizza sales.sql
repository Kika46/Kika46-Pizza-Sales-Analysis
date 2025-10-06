SELECT * FROM Pizza_sales

SELECT SUM(total_price) AS Total_Revenue FROM Pizza_sales;

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM Pizza_sales;

SELECT SUM(quantity) AS Total_pizza_sold FROM Pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM Pizza_sales;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM Pizza_sales;

SELECT TO_CHAR(order_date,'FMDay'),COUNT(DISTINCT order_id) AS total_orders 
FROM Pizza_sales
GROUP BY TO_CHAR(order_date,'FMDay');

SELECT TO_CHAR(order_date,'FMMonth'),COUNT(DISTINCT order_id) AS total_orders 
FROM Pizza_sales
GROUP BY TO_CHAR(order_date,'FMMonth'),DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date);

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from Pizza_sales WHERE EXTRACT(MONTH FROM order_date) = 1 ) AS DECIMAL(10,2)) AS PCT
FROM Pizza_sales
WHERE EXTRACT(MONTH FROM order_date) = 2
GROUP BY pizza_category

SELECT pizza_size,CAST( SUM(total_price)*100/ (SELECT SUM (total_price) FROM Pizza_sales WHERE EXTRACT (QUARTER FROM order_date) = 1) AS DECIMAL(10,2)) AS PCT FROM Pizza_sales
WHERE EXTRACT (QUARTER FROM order_date) = 1
GROUP BY  pizza_size
ORDER BY PCT DESC;

SELECT pizza_name,SUM(total_price) AS Total_Revenue FROM Pizza_sales
GROUP BY pizza_name
ORDER BY SUM(total_price) DESC 
LIMIT 5;

SELECT pizza_name,SUM(total_price) AS Total_Revenue FROM Pizza_sales
GROUP BY pizza_name
ORDER BY SUM(total_price) ASC
LIMIT 5;

SELECT pizza_name,SUM(quantity) AS Total_Quantity FROM Pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity  ASC
LIMIT 5;

SELECT pizza_name,COUNT(DISTINCT(order_id)) AS Total_orders FROM Pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders ASC
LIMIT 5;
SELECT pizza_category, SUM(quantity) AS Total_quantity_sold FROM Pizza_sales
GROUP BY pizza_category
ORDER BY Total_quantity_sold DESC;

SELECT EXTRACT(HOUR FROM order_time) AS order_hours, COUNT(DISTINCT(order_id)) as "total orders" FROM Pizza_sales
GROUP BY order_hours
ORDER BY COUNT(DISTINCT(order_id)) DESC;









