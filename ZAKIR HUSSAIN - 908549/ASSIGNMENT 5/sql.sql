SELECT
    p.product_id,
    p.product_name,
    p.brand_id,
    p.list_price
FROM production.products AS p
WHERE p.list_price > (
    SELECT AVG(p2.list_price)
    FROM production.products AS p2
    WHERE p2.brand_id = p.brand_id
);

SELECT *
FROM sales.orders
WHERE customer_id IN (
    SELECT customer_id
    FROM sales.customers
    WHERE state IN ('NY', 'CA')
);

SELECT *
FROM sales.orders
WHERE customer_id IN (
    SELECT customer_id
    FROM sales.customers
    WHERE state IN ('NY', 'CA')
);

SELECT customer_id
FROM sales.customers
WHERE state IN ('NY', 'CA');

SELECT *
FROM sales.orders
WHERE customer_id IN (...);

SELECT AVG(item_count * 1.0) AS avg_items_per_order
FROM (
    SELECT order_id, COUNT(*) AS item_count
    FROM sales.order_items
    GROUP BY order_id
) AS order_summary;

SELECT *
FROM sales.customers
WHERE customer_id IN (
    SELECT customer_id
    FROM sales.orders
);

SELECT
    c.customer_id,
    c.first_name,
    o.order_id,
    o.order_date
FROM sales.customers AS c
CROSS APPLY (
    SELECT TOP 3
        order_id,
        order_date
    FROM sales.orders AS o
    WHERE o.customer_id = c.customer_id
    ORDER BY order_date DESC
) AS o;

WHERE list_price = ANY (
    SELECT list_price
    FROM production.products
    WHERE brand_id = 1
);

WHERE list_price IN (
    SELECT list_price
    FROM production.products
    WHERE brand_id = 1
);

SELECT *
FROM production.products
WHERE list_price > ALL (
    SELECT list_price
    FROM production.products
    WHERE brand_id = 1
);