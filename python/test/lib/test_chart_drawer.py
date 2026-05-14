import datetime
import json
import os

from chart_drawer import ChartDrawer
from list_handler import __csv_to_dicts__


def test_csv(tmp_dir):
    csv_path = os.path.join('..', 'csv', 'test_data.csv')
    with open(os.path.join('..', 'json', 'res_bodies.json')) as f:
        res_bodies = json.loads(f.read())
    chart_drawer = ChartDrawer(csv_path, res_bodies)

    filename = os.path.join(
        tmp_dir, f'accuracy_score_chart_{datetime.datetime.now():%Y%m%d%H%M%S}.csv',
    )
    with open(filename, 'w') as f:
        chart_drawer.csv(f)

    assert len(__csv_to_dicts__(filename)) == len(__csv_to_dicts__(csv_path))
