product = "  фермерский ТВОРОГ "
price = 4.567
qty = 3
csv_row = "milk,bread,cheese"
review = "Это лучший творог в городе!"
file_path = r"C:\EcoMarket\data\2025\january\sales.csv"
clean_product = product.strip().title()
total = price * qty
receipt = (
    f"Чек \"EcoMarket\"\n"
    f"Товар: {clean_product}\n"
    f"Кол-во: {qty}\n"
    f"Итого: {total:.2f} руб."
)
print(receipt)
split_row = csv_row.split(",")
joined_row = " | ".join(split_row)
print(joined_row)
if "творог" in review.lower():
    print("Отзыв относится к категории: Dairy")
print(file_path)
