import glob
import os
import shutil
import sys

sys.path.append('./src')
sys.path.append('./src/lib')
sys.path.append('./src/queries')


import pytest


@pytest.fixture(autouse=True)
def _cleanup_pycaches():
    before = set(glob.glob(os.path.join('.', '**', '__pycache__'), recursive=True))
    yield
    for pycache in before:
        if os.path.exists(pycache):
            shutil.rmtree(pycache)


@pytest.fixture
def tmp_dir():
    dirname = os.path.join('test', 'tmp')
    os.makedirs(dirname, exist_ok=True)
    yield dirname
    if os.path.exists(dirname):
        shutil.rmtree(dirname)
