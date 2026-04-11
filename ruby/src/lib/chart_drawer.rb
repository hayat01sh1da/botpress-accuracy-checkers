# rbs_inline: enabled

require 'csv'

module Lib
  class ChartDrawer
    # @rbs test_data: String
    # @rbs res_bodies: Array[Hash[String, untyped]]
    # @rbs return: void
    def initialize(test_data, res_bodies)
      @test_data  = CSV.read(test_data, headers: true)
      @res_bodies = res_bodies
    end

    # @rbs return: String
    def csv
      CSV.generate(headers:, write_headers: true) { |csv|
        rows.each_with_index { |row, index|
          csv.add_row([test_data[index]['ID'], test_data[index]['Question']].concat(row))
        }
      }
    end

    private

    attr_reader :test_data, :res_bodies

    # @rbs return: Array[String]
    def headers
      ['ID', 'Test_Data'].concat(test_data['ID'])
    end

    # @rbs return: Array[Array[Hash[String, (String | Float)]]]
    def score_tables
      res_bodies.map { |res_body|
        (0...res_body['suggestions'].length).map { |index|
          score_table         = Hash.new
          answer              = res_body['suggestions'][index]['payloads'][0]['text']
          score               = res_body['suggestions'][index]['confidence']
          score_table[answer] = score
          score_table
        }
      }
    end

    # @rbs return: Array[Array[String]]
    def rows
      score_tables.map { |score_table|
        scores = Array.new
        scores.fill('0.0%', 0...test_data['Answer'].length)
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
