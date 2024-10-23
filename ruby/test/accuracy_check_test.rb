# require_relative './application_test'
# require_relative '../src/accuracy_check'

# class AccuracyCheckTest < ApplicationTest
#   def setup
#     super
#     scheme          = 'https'
#     host            = 'oasist-botpress-server.herokuapp.com'
#     bot_id          = 'sample-bot'
#     user_id         = 'oasist'
#     test_data       = File.join('..', 'csv', 'test_data.csv')
#     @accuracy_check = AccuracyCheck.new(scheme, host, bot_id, user_id, test_data)
#   end

#   def teardown
#     super
#   end

#   def test_export_chart
#     accuracy_check.export_chart(dirname)
#     assert Dir[File.join(dirname, 'accuracy_score_chart*.json')].any?
#   end

#   private

#   attr_reader :accuracy_check
# end
