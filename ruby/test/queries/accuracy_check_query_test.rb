# require 'csv'
# require 'json'
# require_relative '../application_test'
# require_relative '../../src/queries/accuracy_check_query'

# class AccuracyCheckQueryTest < ApplicationTest
#   def setup
#     scheme                = 'https'
#     host                  = 'oasist-botpress-server.herokuapp.com'
#     bot_id                = 'sample-bot'
#     user_id               = 'oasist'
#     @csv_path             = File.join('..', 'csv', 'test_data.csv')
#     @accuracy_check_query = ::Queries::AccuracyCheckQuery.new(scheme, host, bot_id, user_id, csv_path)
#   end

#   def test_res_bodies
#     res_bodies = accuracy_check_query.res_bodies
#     test_data  = CSV.read(csv_path, headers: true)
#     assert_equal test_data.size, res_bodies.size
#   end

#   private

#   attr_reader :csv_path, :accuracy_check_query
# end
