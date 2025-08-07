-- Analyze the cumulative revenue generated over day



select day,
round(sum(revenue)over(order by day),2) as camulative
from
(select o.order_date as day,
sum(od.quantity*p.price) as revenue from
orders as o join orders_details as od on o.order_id=od.order_id join pizzas as p on p.pizza_id=od.pizza_id group by day) as revenue_per_day;