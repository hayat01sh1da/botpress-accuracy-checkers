import unittest
import os
import glob
import sys
sys.path.append('./src')
from training_data import TrainingData
from test_application import TestApplication

class TestTrainingData(TestApplication):
    def setUp(self):
        super().setUp()
        training_data = os.path.join('..', 'csv', 'training_data.csv')
        self.training_data = TrainingData(training_data)

    def test_export(self):
        self.training_data.export(self.dirname)
        self.assertTrue(any(glob.glob('{dirname}/training_data*.json'.format(dirname = self.dirname))))

if __name__ == '__main__':
    unittest.main()
