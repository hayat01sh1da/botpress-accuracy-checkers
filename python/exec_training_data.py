import os
import sys
sys.path.append('./src')
sys.path.append('./src/lib')
from training_data import TrainingData

csv_training_data = os.path.join('..', 'csv', 'training_data.csv')
dirname           = '../json'

training_data = TrainingData(csv_training_data)
training_data.export(dirname)
print("--- Successfully exported JSON training data under {dirname}/ ---".format(dirname = dirname))
