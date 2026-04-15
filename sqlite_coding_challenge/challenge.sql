-- TASK 1
SELECT 
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spend
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
GROUP BY c.id
ORDER BY total_spend DESC
LIMIT 5;


