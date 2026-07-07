SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    SUM(s.total_price) AS total_sales
FROM 
    employees e
JOIN 
    sales s ON e.employee_id = s.employee_id
GROUP BY 
    e.employee_id,
    e.first_name,
    e.last_name
HAVING 
    SUM(s.total_price) > 1000;
UPDATE products
SET class = 'A'
WHERE category_id IN (
    SELECT p.category_id
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    GROUP BY p.category_id
    HAVING SUM(s.total_price) > 5000
);
UPDATE products
SET modify_timestamp = NOW()::varchar
WHERE modify_timestamp IS NULL 
   OR modify_timestamp = '';
