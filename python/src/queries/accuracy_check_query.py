import urllib.request
import csv
import json
import os
import re
from list_handler import __csv_to_dicts__

INVALID_PATTERNS = r'[\\\'\|\`\^\"\<\>\)\(\}\{\]\[\;\/\?\:\@\&\=\+\$\,\%\# ]'

class AccuracyCheckQuery:
    def __init__(self, scheme, host, bot_id, user_id, test_data):
        self.scheme    = re.sub(INVALID_PATTERNS, '', scheme)
        self.host      = re.sub(INVALID_PATTERNS, '', host)
        self.bot_id    = re.sub(INVALID_PATTERNS, '', bot_id)
        self.user_id   = re.sub(INVALID_PATTERNS, '', user_id)
        self.test_data = __csv_to_dicts__(test_data)

    def res_bodies(self):
        return [json.loads(res_body.read()) for res_body in self._request()]

    # private

    def _uri(self):
        return '{}://{}/api/v1/bots/{}/converse/{}/secured?include=suggestions'.format(self.scheme, self.host, self.bot_id, self.user_id)

    def _request(self):
        responses = list()
        for test_datum in self.test_data:
            header = {
                'Content-Type': 'application/json',
                'Authorization': os.environ['BOTPRESS_ACCESS_TOKEN']
            }
            body = {
                'type': 'text',
                'text': test_datum['Question']
            }
            req = urllib.request.Request(self._uri(), json.dumps(body).encode(), header)
            res = urllib.request.urlopen(req)
            responses.append(res)
        return responses
