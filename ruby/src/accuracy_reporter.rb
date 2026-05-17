# rbs_inline: enabled

require_relative './queries/accuracy_check_query'
require_relative './lib/csv_chart_drawer'

class AccuracyReporter
  # @rbs scheme: String
  # @rbs host: String
  # @rbs bot_id: String
  # @rbs user_id: String
  # @rbs path_to_test_data: String
  # @rbs path_to_accuracy_score_chart: String
  # @rbs return: void
  def self.run(scheme:, host:, bot_id:, user_id:, path_to_test_data:, path_to_accuracy_score_chart:)
    new(scheme:, host:, bot_id:, user_id:, path_to_test_data:, path_to_accuracy_score_chart:).run
  end

  # @rbs scheme: String
  # @rbs host: String
  # @rbs bot_id: String
  # @rbs user_id: String
  # @rbs path_to_test_data: String
  # @rbs path_to_accuracy_score_chart: String
  # @rbs return: void
  def initialize(scheme:, host:, bot_id:, user_id:, path_to_test_data:, path_to_accuracy_score_chart:)
    @scheme                       = scheme
    @host                         = host
    @bot_id                       = bot_id
    @user_id                      = user_id
    @path_to_test_data            = path_to_test_data
    @path_to_accuracy_score_chart = path_to_accuracy_score_chart
  end

  # @rbs return: void
  def run
    res_bodies = accuracy_check_query.res_bodies
    csv_chart  = csv_chart_drawer(res_bodies).csv
    File.open(filename(path_to_accuracy_score_chart), 'w') { |f| f.puts(csv_chart) }
  end

  private

  attr_reader :scheme, :host, :bot_id, :user_id, :path_to_test_data, :path_to_accuracy_score_chart

  # @rbs return: Queries::AccuracyCheckQuery
  def accuracy_check_query
    @accuracy_check_query ||= ::Queries::AccuracyCheckQuery.new(scheme, host, bot_id, user_id, path_to_test_data)
  end

  # @rbs res_bodies: Array[Hash[String, untyped]]
  # @rbs return: Lib::CsvChartDrawer
  def csv_chart_drawer(res_bodies)
    @csv_chart_drawer ||= ::Lib::CsvChartDrawer.new(path_to_test_data, res_bodies)
  end

  # @rbs path_to_accuracy_score_chart: String
  # @rbs return: String
  def filename(path_to_accuracy_score_chart)
    File.join(path_to_accuracy_score_chart, "accuracy_score_chart_#{Time.now.strftime('%F%T').gsub(/[:\-]/, '')}.csv")
  end
end
