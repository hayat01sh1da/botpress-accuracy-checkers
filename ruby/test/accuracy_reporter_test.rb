# frozen_string_literal: true

# rbs_inline: enabled

# require_relative './application_test'
# require_relative '../src/accuracy_reporter'

# class AccuracyReporterTest < ApplicationTest
#   def setup
#     super
#     scheme          = 'https'
#     host            = 'oasist-botpress-server.herokuapp.com'
#     bot_id          = 'sample-bot'
#     user_id         = 'oasist'
#     test_data       = File.join('..', 'csv', 'test_data.csv')
#     @accuracy_reporter = AccuracyReporter.new(scheme, host, bot_id, user_id, test_data)
#   end

#   def teardown
#     super
#   end

#   def test_export_chart
#     accuracy_reporter.export_chart(dirname)
#     assert Dir[File.join(dirname, 'accuracy_score_chart*.json')].any?
#   end

#   private

#   attr_reader :accuracy_reporter
# end
