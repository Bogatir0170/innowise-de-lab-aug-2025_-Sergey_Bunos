SELECT 
    p.product_name,
    SUM(s.total_price) AS total_revenue,
    AVG(s.total_price) AS avg_sale
FROM 
    products p
JOIN 
    sales s ON p.product_id = s.product_id
GROUP BY 
    p.product_id,
    p.product_name
HAVING 
    SUM(s.total_price) > 400000.00
ORDER BY 
    total_revenue DESC;
