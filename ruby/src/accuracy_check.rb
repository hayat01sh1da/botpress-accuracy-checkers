require_relative './queries/accuracy_check_query'
require_relative './lib/chart_drawer'

class AccuracyCheck
  def initialize(scheme, host, bot_id, user_id, test_data)
    @scheme    = scheme
    @host      = host
    @bot_id    = bot_id
    @user_id   = user_id
    @test_data = test_data
  end

  def export_chart(dirname)
    res_bodies = accuracy_check_query.res_bodies
    csv_chart   = chart_drawer(res_bodies).csv
    File.open(filename(dirname), 'w') { _1.puts(csv_chart) }
  end

  private

  attr_reader :scheme, :host, :bot_id, :user_id, :test_data

  def accuracy_check_query
    @accuracy_check_query ||= ::Lib::AccuracyCheckQuery.new(scheme, host, bot_id, user_id, test_data)
  end

  def chart_drawer(res_bodies)
    @chart_drawer ||= ::Lib::ChartDrawer.new(test_data, res_bodies)
  end

  def filename(dirname)
    File.join(dirname, "accuracy_score_chart_#{Time.now.strftime('%F%T').gsub(/[:\-]/, '')}.csv")
  end
end
