total_revenue = 0
daily_logs = [
    [500, 0, 1200],       # Касса 1 (Нормальная)
    [300, -999, 800],     # Касса 2 (Сломалась посередине, 800 не должно посчитаться)
    [1500, 200]           # Касса 3 (Нормальная)
]
for idx, cash_box in enumerate(daily_logs):
    print(f"--- Обработка Кассы №{idx + 1} ---")
    for transaction in cash_box:
        if transaction == -999:
            print("Аварийная остановка кассы!")
            break
        if transaction == 0:
            print("Сбой (0).")
            continue
        if transaction > 0:
            total_revenue += transaction
            print(f"Добавлено: {transaction}")
print("=== ИТОГ ДНЯ ===")
print(f"Общая выручка магазина: {total_revenue}")
