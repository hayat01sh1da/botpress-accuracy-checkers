import datetime
import json
import os

from csv_chart_drawer import CSVChartDrawer
from list_handler import __csv_to_dicts__


def test_csv(tmp_dir: str) -> None:
    csv_path = os.path.join('..', 'csv', 'test_data.csv')
    with open(os.path.join('..', 'json', 'res_bodies.json')) as f:
        res_bodies = json.loads(f.read())
    csv_chart_drawer = CSVChartDrawer(csv_path, res_bodies)

    filename = os.path.join(
        tmp_dir, f'accuracy_score_chart_{datetime.datetime.now():%Y%m%d%H%M%S}.csv',
    )
    with open(filename, 'w') as f:
        csv_chart_drawer.csv(f)

    assert len(__csv_to_dicts__(filename)) == len(__csv_to_dicts__(csv_path))
