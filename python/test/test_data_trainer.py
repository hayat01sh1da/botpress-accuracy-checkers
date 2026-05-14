import glob
import os

from data_trainer import DataTrainer


def test_export(tmp_dir: str) -> None:
    DataTrainer(os.path.join('..', 'csv', 'training_data.csv')).export(tmp_dir)
    assert any(glob.glob(f'{tmp_dir}/training_data*.json'))
