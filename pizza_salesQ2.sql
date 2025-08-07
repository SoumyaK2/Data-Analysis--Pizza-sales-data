-- Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(od.quantity * p.price), 2)
FROM
    orders_details AS od
        JOIN
    pizzas AS p ON od.pizza_id = p.pizza_id; 