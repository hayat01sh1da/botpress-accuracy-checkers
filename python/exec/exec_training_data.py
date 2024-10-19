import os
import sys
import shutil
import glob
sys.path.append('./src')
sys.path.append('./src/lib')
from training_data import TrainingData

csv_training_data = os.path.join('..', 'csv', 'training_data.csv')
dirname           = os.path.join('..', 'json')

training_data = TrainingData(csv_training_data)
training_data.export(dirname)
print("--- Successfully exported JSON training data under {dirname}/ ---".format(dirname = dirname))

pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)
for pycache in pycaches:
    if os.path.isdir(pycache):
        shutil.rmtree(pycache)
