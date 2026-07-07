SELECT 
    co.country_name,
    COUNT(sh.shop_id) AS shops_count
FROM 
    countries co
JOIN 
    cities ci ON co.country_id = ci.country_id
JOIN 
    shops sh ON ci.city_id = sh.city_id
GROUP BY 
    co.country_id, 
    co.country_name
ORDER BY 
    shops_count DESC;
