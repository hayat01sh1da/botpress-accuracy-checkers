from format import __to_json__
import os
import datetime
import sys
sys.path.append('./src/lib')


class TrainingDataFormatter:
    def __init__(self, csv_training_data: str) -> None:
        self.csv_training_data = csv_training_data

    def export(self, dirname: str) -> None:
        with open(self.__filename__(dirname), 'w') as f:
            f.write(__to_json__(self.csv_training_data))

    # private

    def __filename__(self, dirname: str) -> str:
        return os.path.join(
            dirname, f'training_data_{
                datetime.datetime.now():%Y%m%d%H%M%S}.json')
