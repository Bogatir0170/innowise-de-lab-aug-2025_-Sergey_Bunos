INSERT INTO products (product_id, product_name, price, category_id, class, is_allergic, resistant, vitality_days)
VALUES 
(99991, 'Test Product Alpha', 150.00, 1, 'A', 'No', 'No', 10),
(99992, 'Test Product Beta', 250.00, 1, 'B', 'Yes', 'Yes', 14);
SELECT * 
FROM products 
WHERE is_allergic = 'Yes' 
  AND resistant = 'Yes';
UPDATE products 
SET is_allergic = 'Yes' 
WHERE product_name = 'Bananas Family Pack';
DELETE FROM products 
WHERE product_id = 99991;
SELECT * FROM products;
