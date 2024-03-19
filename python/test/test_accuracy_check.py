# import unittest
# import os
# import glob
# import sys
# sys.path.append('./src')
# from accuracy_check import AccuracyCheck
# from test_application import TestApplication

# class TestAccuracyCheck(TestApplication):
#     def setUp(self):
#         super().setUp()
#         scheme              = 'https'
#         host                = 'oasist-botpress-server.herokuapp.com'
#         bot_id              = 'sample-bot'
#         user_id             = 'oasist'
#         test_data           = os.path.join('..', 'csv', 'test_data.csv')
#         self.accuracy_check = AccuracyCheck(scheme, host, bot_id, user_id, test_data)

#     def test_export_chart(self):
#         self.accuracy_check.export_chart(self.dirname)
#         self.assertTrue(any(glob.glob('{dirname}/accuracy_score_chart*.csv'.format(dirname = self.dirname))))

# if __name__ == '__main__':
#     unittest.main()
