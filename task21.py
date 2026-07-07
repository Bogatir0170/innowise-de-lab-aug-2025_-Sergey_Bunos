#Инициализация входных переменных
raw_sku = "CARROT-001"
raw_regions = ("Minsk", "Warsaw", "Berlin", "Warsaw")
raw_weight_str = "2.5"
raw_stock_str = "150"

#Явное преобразование типов
weight_kg = float(raw_weight_str)
stock_quantity = int(raw_stock_str)

#Преобразование коллекций
sku_as_list = list(raw_sku)
regions_list = list(raw_regions)
unique_regions = set(raw_regions)
regions_tuple = tuple(unique_regions)

#Создание пустых коллекций двумя способами
empty_list_1 = []
empty_dict_1 = {}
empty_tuple_1 = ()
empty_set = set()

#Создание непустых коллекций
non_empty_list = [1]
non_empty_dict = {1: 1}
non_empty_tuple = (1,)
non_empty_set = {1}

#Вывод в консоль в строгом соответствии с примером вывода
print(weight_kg, type(weight_kg))
print(stock_quantity, type(stock_quantity))
print(sku_as_list, type(sku_as_list))
print(regions_list, type(regions_list))

#Строка, где тип множества, кортежа и первый bool() идут в одну линию
print(unique_regions, type(unique_regions), regions_tuple, type(regions_tuple), bool(empty_list_1))

#Последовательный вывод bool() для остальных пустых и непустых коллекций
print(bool(empty_dict_1))
print(bool(empty_tuple_1))
print(bool(empty_set))
print(bool(non_empty_list))
print(bool(non_empty_dict))
print(bool(non_empty_tuple))
print(bool(non_empty_set))
