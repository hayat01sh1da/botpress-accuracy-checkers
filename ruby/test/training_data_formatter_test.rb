# frozen_string_literal: true

# rbs_inline: enabled

require_relative 'application_test'
require_relative '../src/training_data_formatter'
require_relative '../src/lib/format'

class TrainingDataFormatterTest < ApplicationTest
  def setup
    super
    @path_to_csv_training_data = File.join('..', 'csv', 'training_data.csv')
  end

  def test_export
    TrainingDataFormatter.run(path_to_csv_training_data:, path_to_json_training_data: path_to_tmp_test_dir)

    assert_predicate Dir[File.join(path_to_tmp_test_dir, 'training_data*.json')], :any?
  end

  private

  attr_reader :path_to_csv_training_data
end
