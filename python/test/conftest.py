import pytest
import glob
import os
import shutil
import sys
from collections.abc import Iterator

sys.path.append('./src')
sys.path.append('./src/lib')
sys.path.append('./src/queries')


@pytest.fixture(autouse=True)
def __cleanup_caches__() -> Iterator[None]:
    caches = set(
        glob.glob(
            os.path.join(
                '.',
                '**',
                '.*py.*cache.*'),
            recursive=True))
    yield
    for cache in caches:
        if os.path.exists(cache):
            shutil.rmtree(cache)


@pytest.fixture
def tmp_dir() -> Iterator[str]:
    dirname = os.path.join('test', 'tmp')
    os.makedirs(dirname, exist_ok=True)
    yield dirname
    if os.path.exists(dirname):
        shutil.rmtree(dirname)
