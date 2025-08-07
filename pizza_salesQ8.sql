-- Average orders per hour

-- count of orders per day-unnessary
SELECT 
    order_date, COUNT(order_id) AS total_orders
FROM
    orders
GROUP BY order_date;

-- no. of orders per day in an hour
SELECT
        order_date,
        HOUR(order_time) AS order_hour,
        COUNT(*) AS orders_per_hour
    FROM
        orders
    GROUP BY
        order_date,
        order_hour;


-- avg orders per day in an hour        
SELECT
    order_date,
    AVG(orders_per_hour) AS average_orders_per_hour
FROM (
    SELECT
        order_date,
        HOUR(order_time) AS order_hour,
        COUNT(*) AS orders_per_hour
    FROM
        orders
    GROUP BY
        order_date,
        order_hour
) AS hourly_orders
GROUP BY
    order_date;
    


-- avg orders per hour    
SELECT 
    round(AVG(average_orders_per_hour),2) as average_orders_in_a_hour
FROM
    (SELECT 
        order_date, AVG(orders_per_hour) AS average_orders_per_hour
    FROM
        (SELECT 
        order_date,
            HOUR(order_time) AS order_hour,
            COUNT(*) AS orders_per_hour
    FROM
        orders
    GROUP BY order_date , order_hour) AS hourly_orders
    GROUP BY order_date) AS total_average_orders_per_hour;