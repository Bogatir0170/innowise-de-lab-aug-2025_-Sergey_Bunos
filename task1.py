category_a = "Vegetables"
category_b = "Fruits"
price_per_unit_a = 150
quantity_a = 40
vat_rate = 0.2
#Меняем значения переменных
category_a, category_b = category_b, category_a
#Расчет общей стоимости партии фруктов
total_price = (quantity_a * price_per_unit_a) + (price_per_unit_a * quantity_a * vat_rate)
#Вывод результатов
print("Текущая категория A: ", category_a)
print("Общая стоимость партии с НДС: ", total_price)