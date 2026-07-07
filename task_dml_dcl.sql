UPDATE products
SET price = price * 1.10
WHERE category_id = (
    SELECT category_id 
    FROM categories 
    WHERE category_name = 'Fruits'
);
DELETE FROM employees
WHERE employee_id NOT IN (
    SELECT DISTINCT employee_id 
    FROM sales 
    WHERE employee_id IS NOT NULL
);
BEGIN;

-- Вставляем нового сотрудника
INSERT INTO employees (employee_id, first_name, last_name, shop_id, birth_date, gender, hire_date)
VALUES (88, 'John', 'Does', 1, '1990-05-15', 'Male', '2026-01-01');

-- Вставляем его первую продажу (используем существующие в базе product_id и customer_id, например, 1)
INSERT INTO sales (sales_id, employee_id, customer_id, product_id, quantity, discount, total_price, sales_timestamp, transaction_number)
VALUES (777777, 88888, 1, 1, 2, 0.0, 300.0, '2026-01-01 12:00:00', 'TXN88888');

COMMIT;
