raw_log = "ORDER-2025-01-15|FRT-APPLE-PL|+111 (23) 456-78-90| мИНсК "
order_id, product_code, raw_phone, raw_city = raw_log.split("|")
category = product_code[:3]
region = product_code[-2:]
dash_pos = product_code.find("-")
print(f"Позиция первого дефиса в коде товара: {dash_pos}")
if product_code.startswith("FRT"):
    print("Код товара начинается с 'FRT'")
else:
    print("Код товара не начинается с 'FRT'")
clean_phone = ""
for char in raw_phone:
    if char.isdigit():
        clean_phone += char
print(f"Длина номера телефона: {len(clean_phone)}")
clean_city = raw_city.strip().lower().title()
report = (
    f"Заказ: {order_id}\n"
    f"Категория: {category} | Регион: {region}\n"
    f"Телефон: {clean_phone}\n"
    f"Город: {clean_city}"
)
print(report)
