-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select category,pizza_name,total_revenue
from
(select category,pizza_name,total_revenue,
rank() over(partition by category order by total_revenue desc) as serial_no
from
(SELECT 
	pt.category as category,
    pt.name AS pizza_name,
    SUM(od.quantity * p.price) AS total_revenue
FROM
    orders_details AS od
        JOIN
    pizzas AS p ON od.pizza_id = p.pizza_id
        JOIN
    pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY category,pizza_name) as revenue_per_name_per_category) as ranking_table where serial_no<=3;
