# frozen_string_literal: true

# rbs_inline: enabled

# require_relative './application_test'
# require_relative '../src/accuracy_reporter'

# class AccuracyReporterTest < ApplicationTest
#   def setup
#     super
#     @scheme    = 'https'
#     @host      = 'oasist-botpress-server.herokuapp.com'
#     @bot_id    = 'sample-bot'
#     @user_id   = 'oasist'
#     @test_data = File.join('..', 'csv', 'test_data.csv')
#   end

#   def teardown
#     super
#   end

#   def test_export_chart
#     AccuracyReporter.run(scheme:, host:, bot_id:, user_id:, test_data:, dirname:)
#     assert_predicate Dir[File.join(dirname, 'accuracy_score_chart*.json')], :any?
#   end

#   private

#   attr_reader :scheme, :host, :bot_id, :user_id, :test_data
# end
