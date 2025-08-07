-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(order_time) AS _Hour, COUNT(order_id) AS total_orders
FROM
    orders
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time);

