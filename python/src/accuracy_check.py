import os
import datetime
import sys
sys.path.append('./src/lib')
sys.path.append('./src/queries')
from accuracy_check_query import AccuracyCheckQuery
from chart_drawer import ChartDrawer

class AccuracyCheck:
    def __init__(self, scheme, host, bot_id, user_id, test_data):
        self.scheme               = scheme
        self.host                 = host
        self.bot_id               = bot_id
        self.user_id              = user_id
        self.test_data            = test_data
        self.accuracy_check_query = None
        self.res_bodies           = None
        self.chart_drawer         = None

    def export_chart(self, dirname):
        self.res_bodies = self._accuracy_check_query().res_bodies()
        with open(self._filename(dirname), 'w') as f:
            self._chart_drawer().csv(f)

    # private

    def _accuracy_check_query(self):
        if self.accuracy_check_query:
            return self.accuracy_check_query
        else:
            self.accuracy_check_query = AccuracyCheckQuery(self.scheme, self.host, self.bot_id, self.user_id, self.test_data)
            return self.accuracy_check_query

    def _chart_drawer(self):
        if self.chart_drawer:
            return self.chart_drawer
        else:
            self.chart_drawer = ChartDrawer(self.test_data, self.res_bodies)
            return self.chart_drawer

    def _filename(self, dirname):
      return os.path.join(dirname, 'accuracy_score_chart_{0:%Y%m%d%H%M%S}.csv'.format(datetime.datetime.now()))
