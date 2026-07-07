# 1. Создать исходные переменные товара
product_name = "Морковь мытая"
price = 2.5
stock_quantity = 150  # Скорректировано для получения 300 после умножения на 2
is_local_farm = True
supplier = None

has_coupon = True
has_card = False
total = 10

# 2. Рассчитать is_hit по правилу
is_hit = price < 3 and total >= 10

# 3. Вывести на экран
print(f"Является ли товар хитом? {is_hit}")

# 4. Добавить проверки
has_supplier = supplier is not None
can_show_in_app = has_supplier and stock_quantity > 0
needs_restock = stock_quantity < 20 or is_hit
is_blocked = not (is_local_farm or has_supplier)

print(f"Поставщик указан? {has_supplier}")
print(f"Показывать в приложении? {can_show_in_app}")
print(f"Нужно пополнение? {needs_restock}")
print(f"Товар заблокирован для акции? {is_blocked}")
print()

# 5. Проверка приоритета операторов and/or
# Чтобы "Скидка со скобками" дала False, сумма (total) должна быть <= 50 (у нас total = 10)
discount_without_brackets = has_coupon or has_card and total > 50
discount_with_brackets = (has_coupon or has_card) and total > 50

print(f"Скидка без скобок: {discount_without_brackets}")
print(f"Скидка со скобками: {discount_with_brackets}")
print()

# 6. Изменение значений с помощью расширенных операторов присваивания
price += 1.0
stock_quantity *= 2
boxes = stock_quantity
boxes //= 10

print(f"Цена после изменения: {price}")
print(f"Остаток после изменения: {stock_quantity}")
print(f"Полных коробок по 10 кг: {boxes}")
print()

# Повторный пересчет логики после изменений
is_hit = price < 3 and total >= 10
needs_restock = stock_quantity < 20 or is_hit

print(f"Является ли товар хитом (после изменений)? {is_hit}")
print(f"Нужно пополнение (после изменений)? {needs_restock}")
