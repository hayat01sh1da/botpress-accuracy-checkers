require_relative '../src/accuracy_check'

scheme    = 'https'
host      = 'oasist-botpress-server.herokuapp.com'
bot_id    = 'sample-bot'
user_id   = 'oasist'
dirname   = File.join('..', 'csv')
test_data = File.join(dirname, 'test_data.csv')

accuracy_check = AccuracyCheck.new(scheme, host, bot_id, user_id, test_data)
accuracy_check.export_chart(dirname)
puts "--- Successfully exported accuracy score chart under #{dirname}/ ---"
