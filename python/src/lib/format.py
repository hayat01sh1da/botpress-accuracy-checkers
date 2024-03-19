import csv
import json
from list_handler import __uniq_list__

def __template__():
    return {
      'id': '',
      'data': {
        'action': 'text',
        'contexts': ['sample'],
        'enabled': True,
        'answers': {
          'ja': ['']
        },
        'questions': {
          'ja': []
        },
        'redirectFlow': '',
        'redirectNode': ''
      }
    }

def __to_json__(csv_training_data):
    result = list()
    format = __template__()

    with open(csv_training_data) as f:
        training_data = csv.DictReader(f)
        for training_datum in training_data:
            if format['data']['answers']['ja'][-1] == training_datum['Answer']:
                format['data']['questions']['ja'].append(training_datum['Question'])
            else:
                format       = __template__()
                format['id'] = training_datum['ID']
                format['data']['questions']['ja'].append(training_datum['Question'])
                format['data']['answers']['ja'].remove('')
                format['data']['answers']['ja'].append(training_datum['Answer'])
            format['data']['questions']['ja'] = __uniq_list__(format['data']['questions']['ja'])
            result.append(format)
    return json.dumps({ 'qnas': __uniq_list__(result) }, ensure_ascii = False, indent = 2)
