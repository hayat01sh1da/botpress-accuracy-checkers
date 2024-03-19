require 'csv'
require 'json'

module Lib
  module Format
    def template
      {
        id: '',
        data: {
          action: 'text',
          contexts: ['sample'],
          enabled: true,
          answers: {
            ja: []
          },
          questions: {
            ja: []
          },
          redirectFlow: '',
          redirectNode: ''
        }
      }
    end

    def to_json(training_data)
      result = Array.new
      format = template

      CSV.foreach(training_data, headers: true) { |training_datum|
        if format[:data][:answers][:ja].last == training_datum['Answer']
          format[:data][:questions][:ja] << training_datum['Question']
        else
          format = template
          format[:id] = training_datum['ID']
          format[:data][:questions][:ja] << training_datum['Question']
          format[:data][:answers][:ja] << training_datum['Answer']
        end
        format[:data][:questions][:ja].uniq!
        result << format
      }

      JSON.pretty_generate({ qnas: result.uniq })
    end
  end
end
