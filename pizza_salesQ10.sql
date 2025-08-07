-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pt.name AS pizza_name,
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM
    orders_details AS od
        JOIN
    pizzas AS p ON od.pizza_id = p.pizza_id
        JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_revenue desc
LIMIT 3;

