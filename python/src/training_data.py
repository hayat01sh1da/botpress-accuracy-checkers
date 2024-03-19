import os
import datetime
import sys
sys.path.append('./src/lib')
from format import __to_json__

class TrainingData:
    def __init__(self, training_data):
        self.training_data = training_data

    def export(self, dirname):
        with open(self._filename(dirname), 'w') as f:
            f.write(__to_json__(self.training_data))

    # private

    def _filename(self, dirname):
      return os.path.join(dirname, 'training_data_{0:%Y%m%d%H%M%S}.json'.format(datetime.datetime.now()))
