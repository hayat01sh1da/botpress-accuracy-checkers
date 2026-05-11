from data_trainer import DataTrainer
import os
import sys
import shutil
import glob
sys.path.append('./src')
sys.path.append('./src/lib')

csv_training_data = os.path.join('..', 'csv', 'training_data.csv')
dirname = os.path.join('..', 'json')

data_trainer = DataTrainer(csv_training_data)
data_trainer.export(dirname)
print(f'--- Successfully exported JSON training data under {dirname}/ ---')

pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive=True)
for pycache in pycaches:
    if os.path.exists(pycache):
        shutil.rmtree(pycache)
