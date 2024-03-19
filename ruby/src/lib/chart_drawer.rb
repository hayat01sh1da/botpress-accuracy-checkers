require 'csv'

module Lib
  class ChartDrawer
    def initialize(test_data, res_bodies)
      @test_data  = CSV.read(test_data, headers: true)
      @res_bodies = res_bodies
    end

    def csv
      CSV.generate(headers: headers, write_headers: true) { |csv|
        rows.each_with_index { |row, index|
          csv.add_row([test_data[index]['ID'], test_data[index]['Question']].concat(row))
        }
      }
    end

    private

    attr_reader :test_data, :res_bodies

    def headers
      ['ID', 'Test_Data'].concat(test_data['ID'])
    end

    def score_tables
      res_bodies.map { |res_body|
        (0...res_body['suggestions'].size).map { |index|
          score_table         = Hash.new
          answer              = res_body['suggestions'][index]['payloads'][0]['text']
          score               = res_body['suggestions'][index]['confidence']
          score_table[answer] = score
          score_table
        }
      }
    end

    def rows
      score_tables.map { |score_table|
        scores = Array.new
        scores.fill('0.0%', 0...test_data['Answer'].size)
        score_table.map { |score_mapping|
          score_mapping.each { |answer, score|
            index         = test_data['Answer'].find_index(answer)
            scores[index] = "#{sprintf('%.1f', score * 100)}%"
          }
        }
        scores
      }
    end
  end
end
