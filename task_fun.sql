CREATE OR REPLACE FUNCTION AvgSalesPerEmployee(emp_id INT)
RETURNS NUMERIC AS $$
DECLARE
    avg_sales NUMERIC;
BEGIN
    SELECT COALESCE(AVG(total_price), 0)
    INTO avg_sales
    FROM sales
    WHERE employee_id = emp_id;
    
    RETURN avg_sales;
END;
$$ LANGUAGE plpgsql;

SELECT AvgSalesPerEmployee(1);