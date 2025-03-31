require 'rails_helper'

RSpec.describe ChartDrawer do
  let(:chart_drawer) { described_class.new(csv_path, res_bodies) }
  let(:csv_chart)    { chart_drawer.csv }
  let(:csv_path)     { Rails.root.join('csv', 'test_data.csv') }
  let(:json_path)    { Rails.root.join('json', 'res_bodies.json') }
  let(:test_data)    { CSV.read(csv_path) }
  let(:res_bodies)   { File.read(json_path).then { |json| JSON.parse(json) } }

  it 'returns the same number of rows in the CSV chart as that in the test data' do
    expect(test_data.size).to eq(csv_chart.split(/\n/).size)
  end
end
