import unittest
import os
import shutil

class TestApplication(unittest.TestCase):
    def setUp(self):
        self.dirname = os.path.join('test', 'tmp')
        if not os.path.exists(self.dirname):
            os.makedirs(self.dirname)

    def tearDown(self):
        shutil.rmtree(self.dirname)

if __name__ == '__main__':
    unittest.main()
