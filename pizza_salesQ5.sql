-- List the top 5 most ordered pizza types along with their quantities.

SELECT 
    p.pizza_type_id AS pizza_type,
    SUM(od.quantity) AS total_quantity
FROM
    pizzas AS p
        JOIN
    orders_details AS od ON p.pizza_id = od.pizza_id
GROUP BY p.pizza_type_id
ORDER BY total_quantity DESC
LIMIT 5;