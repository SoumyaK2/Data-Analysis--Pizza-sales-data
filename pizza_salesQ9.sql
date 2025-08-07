-- Group the orders by date and calculate the average order per day.

select order_date as day, count(order_id) as order_per_day from orders group by order_date;

SELECT 
    day , round(AVG(order_per_day),2) as average_orders
FROM
    (SELECT 
        order_date AS day, COUNT(order_id) AS order_per_day
    FROM
        orders
    GROUP BY day) AS total_orders_per_day
GROUP BY day;