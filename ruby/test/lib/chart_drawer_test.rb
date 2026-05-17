# rbs_inline: enabled

require 'minitest/autorun'
require 'csv'
require 'json'
require_relative '../../src/lib/csv_chart_drawer'

class CSVChartDrawerTest < Minitest::Test
  def setup
    @csv_path     = File.join('..', 'csv', 'test_data.csv')
    json_path     = File.join('..', 'json', 'res_bodies.json')
    res_bodies    = File.read(json_path).then { |json| JSON.parse(json) }
    @csv_chart_drawer = ::Lib::CSVChartDrawer.new(csv_path, res_bodies)
  end

  def test_csv
    csv_chart = csv_chart_drawer.csv
    test_data = CSV.read(csv_path)
    assert_equal test_data.length, csv_chart.split(/\n/).length
  end

  private

  attr_reader :csv_path, :csv_chart_drawer
end
