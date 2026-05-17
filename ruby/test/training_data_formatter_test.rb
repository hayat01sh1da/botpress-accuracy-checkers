# frozen_string_literal: true

# rbs_inline: enabled

require_relative 'application_test'
require_relative '../src/training_data_formatter'
require_relative '../src/lib/format'

class TrainingDataFormatterTest < ApplicationTest
  def setup
    super
    csv_training_data        = File.join('..', 'csv', 'training_data.csv')
    @training_data_formatter = TrainingDataFormatter.new(csv_training_data)
  end

  def test_export
    training_data_formatter.export(dirname)

    assert_predicate Dir[File.join(dirname, 'training_data*.json')], :any?
  end

  private

  attr_reader :training_data_formatter
end
