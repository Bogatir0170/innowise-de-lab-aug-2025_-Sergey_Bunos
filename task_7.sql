WITH shop_aggr AS (
    SELECT 
        co.country_name,
        sh.shop_id,
        sh.address AS shop_address,
        COUNT(s.sales_id) AS total_sales_count,
        SUM(s.total_price) AS total_sales_amount
    FROM 
        shops sh
    JOIN 
        cities ci ON sh.city_id = ci.city_id
    JOIN 
        countries co ON ci.country_id = co.country_id
    JOIN 
        sales s ON sh.shop_id = sh.shop_id
    GROUP BY 
        co.country_name,
        sh.shop_id,
        sh.address
    HAVING 
        COUNT(s.sales_id) >= 2
)
SELECT 
    country_name,
    shop_id,
    shop_address,
    total_sales_count,
    total_sales_amount,
    SUM(total_sales_amount) OVER (
        PARTITION BY country_name
    ) AS country_total_sales,
    (total_sales_amount / SUM(total_sales_amount) OVER (PARTITION BY country_name)) AS country_sales_share,
    RANK() OVER (
        PARTITION BY country_name 
        ORDER BY total_sales_amount DESC
    ) AS country_rank,
    SUM(total_sales_amount) OVER (
        PARTITION BY country_name 
        ORDER BY total_sales_amount DESC
    ) AS country_running_total
FROM 
    shop_aggr
ORDER BY 
    country_name ASC,
    total_sales_amount DESC;
