import csv
import json
from list_handler import __csv_to_dicts__

class ChartDrawer:
    def __init__(self, test_data, res_bodies):
        self.test_data  = __csv_to_dicts__(test_data)
        self.res_bodies = res_bodies
        self.ids        = [test_datum['ID'] for test_datum in self.test_data]
        self.questions  = [test_datum['Question'] for test_datum in self.test_data]
        self.answers    = [test_datum['Answer'] for test_datum in self.test_data]
        self.header     = ['ID', 'Test_Data'] + self.ids

    def csv(self, f):
        writer = csv.writer(f)
        writer.writerow(self.header)
        i = 0
        for row in self.__rows__():
            writer.writerow([self.ids[i], self.questions[i]] + row)
            i += 1

    # private

    def __score_tables__(self):
        score_tables = list()
        for res_body in self.res_bodies:
            _score_tables = list()
            for i in range(len(res_body['suggestions'])):
                score_table         = dict()
                answer              = res_body['suggestions'][i]['payloads'][0]['text']
                score               = res_body['suggestions'][i]['confidence']
                score_table[answer] = score
                _score_tables.append(score_table)
            score_tables.append(_score_tables)
        return score_tables

    def __rows__(self):
        rows = list()
        for s_tables in self.__score_tables__():
            scores  = list()
            _scores = ['0.0%' * 1 for i in range(len(self.test_data))]
            for s_table in s_tables:
                for answer, score in s_table.items():
                    index          = self.answers.index(answer)
                    _scores[index] = f'{score * 100:.1f}%'
            scores.append(_scores)
            rows.extend(scores)
        return rows
