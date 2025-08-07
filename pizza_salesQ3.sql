-- Identify the highest-priced pizza.

SELECT 
    pt.name AS highest_priced_pizza
FROM
    pizza_types AS pt
        JOIN
    pizzas AS p ON pt.pizza_type_id = p.pizza_type_id
WHERE
    p.price = (SELECT 
            MAX(price)
        FROM
            pizzas);