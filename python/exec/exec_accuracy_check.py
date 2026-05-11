from accuracy_reporter import AccuracyReporter
import os
import sys
import shutil
import glob
sys.path.append('./src')
sys.path.append('./src/lib')
sys.path.append('./src/queries')

scheme = 'https'
host = 'oasist-botpress-server.herokuapp.com'
bot_id = 'sample-bot'
user_id = 'oasist'
dirname = os.path.join('..', 'csv')
test_data = os.path.join(dirname, 'test_data.csv')

accuracy_reporter = AccuracyReporter(scheme, host, bot_id, user_id, test_data)
accuracy_reporter.export_chart(dirname)
print(f'--- Successfully exported accuracy score chart under {dirname}/ ---')

pycaches = glob.glob(os.path.join('.', '**', '__pycache__'), recursive=True)
for pycache in pycaches:
    if os.path.exists(pycache):
        shutil.rmtree(pycache)
