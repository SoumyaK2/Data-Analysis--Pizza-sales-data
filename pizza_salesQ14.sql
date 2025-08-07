-- Group the orders by date and calculate the average number of pizzas ordered in a  day.
select o.order_date as day, sum(od.quantity) as order_per_day from orders as o join orders_details as od on o.order_id=od.order_id group by order_date;

SELECT 
    ROUND(AVG(order_per_day), 2) AS average_orders_in_a_day
FROM
    (SELECT 
        o.order_date AS day, SUM(od.quantity) AS order_per_day
    FROM
        orders AS o
    JOIN orders_details AS od ON o.order_id = od.order_id
    GROUP BY order_date) AS total_orders_per_day;
