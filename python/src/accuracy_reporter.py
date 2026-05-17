from csv_chart_drawer import CSVChartDrawer
from accuracy_check_query import AccuracyCheckQuery
import os
import datetime
import sys
sys.path.append('./src/lib')
sys.path.append('./src/queries')


class AccuracyReporter:
    def __init__(
            self,
            scheme: str,
            host: str,
            bot_id: str,
            user_id: str,
            test_data: str) -> None:
        self.scheme = scheme
        self.host = host
        self.bot_id = bot_id
        self.user_id = user_id
        self.test_data = test_data
        self.accuracy_check_query = AccuracyCheckQuery(
            self.scheme, self.host, self.bot_id, self.user_id, self.test_data)
        self.res_bodies = self.accuracy_check_query.res_bodies()
        self.csv_chart_drawer = CSVChartDrawer(self.test_data, self.res_bodies)

    def run(self, dirname: str) -> None:
        with open(self.__filename__(dirname), 'w') as f:
            self.csv_chart_drawer.csv(f)

    # private

    def __filename__(self, dirname: str) -> str:
        return os.path.join(
            dirname, f'accuracy_score_chart_{
                datetime.datetime.now():%Y%m%d%H%M%S}.csv'
        )
