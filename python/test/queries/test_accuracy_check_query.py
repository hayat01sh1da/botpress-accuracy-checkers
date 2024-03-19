# import unittest
# import os
# import sys
# sys.path.append('./src/lib')
# sys.path.append('./src/queries')
# sys.path.append('./test')
# from accuracy_check_query import AccuracyCheckQuery
# from list_handler import __csv_to_dicts__
# from test_application import TestApplication

# class TestAccuracyCheckQuery(TestApplication):
#     def setUp(self):
#         super().setUp()
#         scheme                    = 'https'
#         host                      = 'oasist-botpress-server.herokuapp.com'
#         bot_id                    = 'sample-bot'
#         user_id                   = 'oasist'
#         self.csv_path             = os.path.join('..', 'csv', 'test_data.csv')
#         self.accuracy_check_query = AccuracyCheckQuery(scheme, host, bot_id, user_id, self.csv_path)

#     def test_csv(self):
#         res_bodies = self.accuracy_check_query.res_bodies()
#         test_data  = __csv_to_dicts__(self.csv_path)
#         self.assertEqual(len(test_data), len(res_bodies))

# if __name__ == '__main__':
#     unittest.main()
