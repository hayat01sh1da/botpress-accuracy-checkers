from format import __to_json__
import os
import datetime
import sys
sys.path.append('./src/lib')


class TrainingDataFormatter:
    def __init__(self, path_to_csv_training_data: str) -> None:
        self.path_to_csv_training_data = path_to_csv_training_data

    def export(self, dirname: str) -> None:
        with open(self.__filename__(dirname), 'w') as f:
            f.write(__to_json__(self.path_to_csv_training_data))

    # private

    def __filename__(self, dirname: str) -> str:
        return os.path.join(
            dirname, f'training_data_{
                datetime.datetime.now():%Y%m%d%H%M%S}.json')
