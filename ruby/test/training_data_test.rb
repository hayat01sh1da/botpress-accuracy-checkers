require_relative './application_test'
require_relative '../src/training_data'
require_relative '../src/lib/format'

class TrainingDataTest < ApplicationTest
  def setup
    super
    training_data  = File.join('..', 'csv', 'training_data.csv')
    @training_data = TrainingData.new(training_data)
  end

  def teardown
    super
  end

  def test_export
    training_data.export(dirname)
    assert(Dir[File.join(dirname, 'training_data*.json')].any?)
  end

  private

  attr_reader :training_data
end
