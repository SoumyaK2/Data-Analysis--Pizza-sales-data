-- Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    pt.category AS category, SUM(od.quantity) AS total_quantity
FROM
    orders_details AS od
        JOIN
    pizzas AS p ON p.pizza_id = od.pizza_id
        JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category;
