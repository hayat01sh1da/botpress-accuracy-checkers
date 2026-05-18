import pytest
import re
import os
import shutil
import sys
from collections.abc import Iterator

sys.path.append('./src')
sys.path.append('./src/lib')
sys.path.append('./src/queries')


@pytest.fixture(autouse=True)
def __cleanup_caches__() -> Iterator[None]:
    yield
    cache_dir = re.compile(r'^(?:__pycache__|\.pytest_cache|\.mypy_cache)$')
    for root, dirs, _ in os.walk('.'):
        for name in list(dirs):
            if cache_dir.match(name):
                shutil.rmtree(os.path.join(root, name), ignore_errors=True)
                dirs.remove(name)


@pytest.fixture
def tmp_dir() -> Iterator[str]:
    dirname = os.path.join('test', 'tmp')
    os.makedirs(dirname, exist_ok=True)
    yield dirname
    if os.path.exists(dirname):
        shutil.rmtree(dirname)
