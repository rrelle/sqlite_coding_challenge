-- Task1
SELECT 
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spend
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items oi ON o.id = oi.order_id
GROUP BY c.id
ORDER BY total_spend DESC
LIMIT 5;

-- Task 2
SELECT 
    p.category,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.category
ORDER BY revenue DESC;


-- Task 3
SELECT 
    e.first_name,
    e.last_name,
    d.name AS department,
    e.salary,
    dept_avg.avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.id
JOIN (
    SELECT 
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_avg
ON e.department_id = dept_avg.department_id
WHERE e.salary > dept_avg.avg_salary
ORDER BY d.name, e.salary DESC;

-- Task 4
SELECT 
    city,
    COUNT(*) AS gold_customers
FROM customers
WHERE loyalty_level = 'Gold'
GROUP BY city
ORDER BY gold_customers DESC, city;


