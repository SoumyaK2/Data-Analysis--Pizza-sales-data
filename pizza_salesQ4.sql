-- Identify the most common pizza size ordered.

SELECT 
    p.size AS most_orderd_pizza,
    SUM(od.quantity) AS total_quantity
FROM
    pizzas AS p
        JOIN
    orders_details AS od ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY total_quantity DESC
LIMIT 1;

 