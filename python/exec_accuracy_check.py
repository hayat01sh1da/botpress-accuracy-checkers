import os
import sys
sys.path.append('./src')
sys.path.append('./src/lib')
sys.path.append('./src/queries')
from accuracy_check import AccuracyCheck

scheme    = 'https'
host      = 'oasist-botpress-server.herokuapp.com'
bot_id    = 'sample-bot'
user_id   = 'oasist'
test_data = os.path.join('..', 'csv', 'test_data.csv')
dirname   = '../csv'

accuracy_check = AccuracyCheck(scheme, host, bot_id, user_id, test_data)
accuracy_check.export_chart(dirname)
print("--- Successfully exported accuracy score chart under {dirname}/ ---".format(dirname = dirname))
