CREATE TABLE Data_Layers (
    LayerID SERIAL PRIMARY KEY,
    LayerName VARCHAR(50) UNIQUE NOT NULL,
    Description TEXT
);
INSERT INTO Data_Layers (LayerName, Description)
VALUES 
('Bronze', 'Слой сырых данных (Raw data layer)'),
('Silver', 'Слой очищенных данных (Cleaned data layer)'),
('Gold', 'Слой агрегированных бизнес-данных (Aggregated data layer)');
ALTER TABLE Data_Layers 
ADD COLUMN manager_email VARCHAR(100);
-- Сначала заполняем уникальными значениями
UPDATE Data_Layers SET manager_email = 'bronze_mgr@store.com' WHERE LayerName = 'Bronze';
UPDATE Data_Layers SET manager_email = 'silver_mgr@store.com' WHERE LayerName = 'Silver';
UPDATE Data_Layers SET manager_email = 'gold_mgr@store.com' WHERE LayerName = 'Gold';

-- Теперь безопасно добавляем ограничение UNIQUE
ALTER TABLE Data_Layers 
ADD CONSTRAINT uniq_manager_email UNIQUE (manager_email);
ALTER TABLE Shops 
RENAME COLUMN address TO shop_address;
