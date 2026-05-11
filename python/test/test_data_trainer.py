import unittest
import os
import glob
import sys
sys.path.append('./src')
from data_trainer import DataTrainer
from test_application import TestApplication


class TestDataTrainer(TestApplication):
    def setUp(self) -> None:
        super().setUp()
        data_trainer = os.path.join('..', 'csv', 'training_data.csv')
        self.data_trainer = DataTrainer(data_trainer)

    def test_export(self) -> None:
        self.data_trainer.export(self.dirname)
        self.assertTrue(any(glob.glob(f'{self.dirname}/training_data*.json')))


if __name__ == '__main__':
    unittest.main()
