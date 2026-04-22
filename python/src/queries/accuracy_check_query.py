import urllib.request
import json
import os
import re
from typing import Any
from list_handler import __csv_to_dicts__

INVALID_PATTERNS = r'[\\\'\|\`\^\"\<\>\)\(\}\{\]\[\;\/\?\:\@\&\=\+\$\,\%\# ]'

class AccuracyCheckQuery:
    def __init__(self, scheme: str, host: str, bot_id: str, user_id: str, test_data: str) -> None:
        self.scheme    = re.sub(INVALID_PATTERNS, '', scheme)
        self.host      = re.sub(INVALID_PATTERNS, '', host)
        self.bot_id    = re.sub(INVALID_PATTERNS, '', bot_id)
        self.user_id   = re.sub(INVALID_PATTERNS, '', user_id)
        self.test_data = __csv_to_dicts__(test_data)
        self.uri       = f'{self.scheme}://{self.host}/api/v1/bots/{self.bot_id}/converse/{self.user_id}/secured?include=suggestions'

    def res_bodies(self) -> list[dict[str, Any]]:
        return [json.loads(res_body.read()) for res_body in self.__request__()]

    # private

    def __request__(self) -> list[Any]:
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
            req = urllib.request.Request(self.uri, json.dumps(body).encode(), header)
            res = urllib.request.urlopen(req)
            responses.append(res)
        return responses
