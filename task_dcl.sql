CREATE USER data_engineer_trainee WITH PASSWORD '12345678';
GRANT SELECT ON TABLE sales TO data_engineer_trainee;
SELECT * FROM sales;
INSERT INTO sales (sales_id, employee_id, customer_id, product_id, quantity, discount, total_price, sales_timestamp, transaction_number)
VALUES (99999, 1, 1, 1, 5, 0, 500, '2026-01-01 12:00:00', 'TXN99999');
GRANT INSERT, UPDATE ON TABLE sales TO data_engineer_trainee;
INSERT INTO sales (sales_id, employee_id, customer_id, product_id, quantity, discount, total_price, sales_timestamp, transaction_number)
VALUES (99999, 1, 1, 1, 5, 0, 500, '2026-01-01 12:00:00', 'TXN99999');
UPDATE sales 
SET quantity = 10, total_price = 1000 
WHERE sales_id = 99999;
