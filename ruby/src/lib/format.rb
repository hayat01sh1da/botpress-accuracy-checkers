# rbs_inline: enabled

require 'csv'
require 'json'

module Lib
  module Format
    # @rbs return: Hash[Symbol, untyped]
    def template(array = [])
      {
        id: '',
        data: {
          action: 'text',
          contexts: ['sample'],
          enabled: true,
          answers: {
            ja: array
          },
          questions: {
            ja: array.dup
          },
          redirectFlow: '',
          redirectNode: ''
        }
      }
    end

    # @rbs data_trainer: String
    # @rbs array: Array[untyped]
    # @rbs return: String
    def to_json(data_trainer, array = [])
      result = array
      format = template(array.dup)

      CSV.foreach(data_trainer, headers: true) { |training_datum|
        if format[:data][:answers][:ja].last == training_datum['Answer']
          format[:data][:questions][:ja] << training_datum['Question']
        else
          format      = template
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
