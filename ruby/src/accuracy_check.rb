# rbs_inline: enabled

require_relative './queries/accuracy_check_query'
require_relative './lib/chart_drawer'

class AccuracyCheck
  # @rbs scheme: String
  # @rbs host: String
  # @rbs bot_id: String
  # @rbs user_id: String
  # @rbs test_data: String
  # @rbs return: void
  def initialize(scheme, host, bot_id, user_id, test_data)
    @scheme    = scheme
    @host      = host
    @bot_id    = bot_id
    @user_id   = user_id
    @test_data = test_data
  end

  # @rbs dirname: String
  # @rbs return: void
  def export_chart(dirname)
    res_bodies = accuracy_check_query.res_bodies
    csv_chart  = chart_drawer(res_bodies).csv
    File.open(filename(dirname), 'w') { it.puts(csv_chart) }
  end

  private

  attr_reader :scheme, :host, :bot_id, :user_id, :test_data

  # @rbs return: Queries::AccuracyCheckQuery
  def accuracy_check_query
    @accuracy_check_query ||= ::Queries::AccuracyCheckQuery.new(scheme, host, bot_id, user_id, test_data)
  end

  # @rbs res_bodies: Array[Hash[String, untyped]]
  # @rbs return: Lib::ChartDrawer
  def chart_drawer(res_bodies)
    @chart_drawer ||= ::Lib::ChartDrawer.new(test_data, res_bodies)
  end

  # @rbs dirname: String
  # @rbs return: String
  def filename(dirname)
    File.join(dirname, "accuracy_score_chart_#{Time.now.strftime('%F%T').gsub(/[:\-]/, '')}.csv")
  end
end
