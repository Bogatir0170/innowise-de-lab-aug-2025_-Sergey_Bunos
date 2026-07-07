CREATE OR REPLACE VIEW FullStatShops AS
SELECT 
    sh.shop_id,
    sh.shop_address,
    co.country_name AS country,
    COUNT(s.sales_id) AS total_sales_count,
    COALESCE(SUM(s.total_price), 0) AS total_sales_amount
FROM 
    shops sh
JOIN 
    cities ci ON sh.city_id = ci.city_id
JOIN 
    countries co ON ci.country_id = co.country_id
LEFT JOIN 
    sales s ON sh.shop_id = s.shop_id
GROUP BY 
    sh.shop_id,
    sh.shop_address,
    co.country_name;

SELECT * FROM FullStatShops;
