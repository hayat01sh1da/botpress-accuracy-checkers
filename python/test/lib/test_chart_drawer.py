import unittest
import os
import datetime
import json
import sys
sys.path.append('./src/lib')
sys.path.append('./test')
from chart_drawer import ChartDrawer
from list_handler import __csv_to_dicts__
from test_application import TestApplication

class TestChartDrawer(TestApplication):
    def setUp(self):
        super().setUp()
        self.csv_path   = os.path.join('..', 'csv', 'test_data.csv')
        json_path       = os.path.join('..', 'json', 'res_bodies.json')
        self.res_bodies = None
        with open(json_path) as f:
            self.res_bodies = json.loads(f.read())
        self.chart_drawer = ChartDrawer(self.csv_path, self.res_bodies)

    def test_csv(self):
        filename = os.path.join(self.dirname, f'accuracy_score_chart_{datetime.datetime.now():%Y%m%d%H%M%S}.csv')
        with open(filename, 'w') as f:
            self.chart_drawer.csv(f)
        test_data = __csv_to_dicts__(self.csv_path)
        csv_chart = __csv_to_dicts__(filename)
        self.assertEqual(len(test_data), len(csv_chart))

if __name__ == '__main__':
    unittest.main()
