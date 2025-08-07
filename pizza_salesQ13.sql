-- Calculate the percentage contribution of each pizza category to total revenue.

SELECT 
    pt.category AS category,
    SUM(od.quantity * p.price) AS revenue
FROM
    pizza_types AS pt
        JOIN
    pizzas AS p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    orders_details AS od ON od.pizza_id = p.pizza_id
GROUP BY pt.category;

SELECT 
    category,
    ROUND((revenue / (SELECT 
                    SUM(od.quantity * p.price)
                FROM
                    orders_details AS od
                        JOIN
                    pizzas AS p ON od.pizza_id = p.pizza_id)) * 100,
            2) AS parcentage
FROM
    (SELECT 
        pt.category AS category,
            SUM(od.quantity * p.price) AS revenue
    FROM
        pizza_types AS pt
    JOIN pizzas AS p ON pt.pizza_type_id = p.pizza_type_id
    JOIN orders_details AS od ON od.pizza_id = p.pizza_id
    GROUP BY pt.category) AS find_revenue_per_category
GROUP BY category;