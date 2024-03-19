require 'minitest/autorun'
require 'csv'
require 'json'
require_relative '../../src/lib/chart_drawer'

class ChartDrawerTest < Minitest::Test
  def setup
    @csv_path     = File.join('..', 'csv', 'test_data.csv')
    json_path     = File.join('..', 'json', 'res_bodies.json')
    res_bodies    = File.open(json_path) { |f| f.read }.then { |json| JSON.parse(json) }
    @chart_drawer = ::Lib::ChartDrawer.new(csv_path, res_bodies)
  end

  def test_csv
    csv_chart = chart_drawer.csv
    test_data = CSV.read(csv_path)
    assert_equal test_data.size, csv_chart.split(/\n/).size
  end

  private

  attr_reader :csv_path, :chart_drawer
end
