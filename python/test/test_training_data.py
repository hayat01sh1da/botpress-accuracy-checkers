from test_application import TestApplication
from training_data import TrainingData
import unittest
import os
import glob
import sys
sys.path.append('./src')


class TestTrainingData(TestApplication):
    def setUp(self) -> None:
        super().setUp()
        training_data = os.path.join('..', 'csv', 'training_data.csv')
        self.training_data = TrainingData(training_data)

    def test_export(self) -> None:
        self.training_data.export(self.dirname)
        self.assertTrue(any(glob.glob(f'{self.dirname}/training_data*.json')))


if __name__ == '__main__':
    unittest.main()
