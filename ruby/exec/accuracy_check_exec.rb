# rbs_inline: enabled

require_relative '../src/accuracy_reporter'

scheme    = 'https'
host      = 'oasist-botpress-server.herokuapp.com'
bot_id    = 'sample-bot'
user_id   = 'oasist'
dirname   = File.join('..', 'csv')
test_data = File.join(dirname, 'test_data.csv')

AccuracyReporter.run(scheme:, host:, bot_id:, user_id:, test_data:, dirname:)
puts "--- Successfully exported accuracy score chart under #{dirname}/ ---"
