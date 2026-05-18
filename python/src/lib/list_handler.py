import csv


def __uniq_list__(data: list) -> list:
    result = list()
    for datum in data:
        if datum not in result:
            result.append(datum)
    return result


def __csv_to_dicts__(path_to_test_data: str) -> list[dict[str, str]]:
    data = None
    with open(path_to_test_data) as f:
        reader = csv.DictReader(f)
        data = [datum for datum in reader]
    return data
