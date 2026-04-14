import csv

def __uniq_list__(data: list) -> list:
    result = list()
    for datum in data:
        if not datum in result:
            result.append(datum)
    return result

def __csv_to_dicts__(csv_file: str) -> list[dict[str, str]]:
    data = None
    with open(csv_file) as f:
        reader = csv.DictReader(f)
        data   = [datum for datum in reader]
    return data
