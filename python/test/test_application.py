import unittest
import os
import shutil
import glob

class TestApplication(unittest.TestCase):
    def setUp(self):
        self.dirname  = os.path.join('test', 'tmp')
        self.pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive = True)
        if not os.path.exists(self.dirname):
            os.makedirs(self.dirname)

    def tearDown(self):
        if os.path.isdir(self.dirname):
            shutil.rmtree(self.dirname)
        for pycache in self.pycaches:
            if os.path.isdir(pycache):
                shutil.rmtree(pycache)

if __name__ == '__main__':
    unittest.main()
