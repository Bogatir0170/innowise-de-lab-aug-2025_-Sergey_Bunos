WITH monthly_sales AS (
    SELECT 
        -- NULLIF преобразует пустую строку в NULL, который безопасно пропускается при касте к timestamp
        DATE_TRUNC('month', NULLIF(s.sales_timestamp, '')::timestamp) AS sale_month,
        SUM(s.total_price) AS monthly_revenue
    FROM 
        sales s
    JOIN 
        shops sh ON sh.shop_id = sh.shop_id
    JOIN 
        cities ci ON sh.city_id = ci.city_id
    JOIN 
        countries co ON ci.country_id = co.country_id
    WHERE 
        co.country_name = 'Germany'
        -- Дополнительно отсекаем пустые или некорректные строки, чтобы избежать ошибок
        AND s.sales_timestamp IS NOT NULL 
        AND s.sales_timestamp <> ''
    GROUP BY 
        DATE_TRUNC('month', NULLIF(s.sales_timestamp, '')::timestamp)
)
SELECT 
    sale_month,
    monthly_revenue,
    COALESCE(LAG(monthly_revenue) OVER (ORDER BY sale_month), 0) AS previous_month_revenue,
    (monthly_revenue - COALESCE(LAG(monthly_revenue) OVER (ORDER BY sale_month), 0)) AS revenue_diff_vs_previous
FROM 
    monthly_sales
ORDER BY 
    sale_month ASC;
