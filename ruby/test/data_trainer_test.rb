# frozen_string_literal: true

# rbs_inline: enabled

require_relative 'application_test'
require_relative '../src/data_trainer'
require_relative '../src/lib/format'

class DataTrainerTest < ApplicationTest
  def setup
    super
    data_trainer  = File.join('..', 'csv', 'training_data.csv')
    @data_trainer = DataTrainer.new(data_trainer)
  end

  def test_export
    data_trainer.export(dirname)
    assert Dir[File.join(dirname, 'training_data*.json')].any?
  end

  private

  attr_reader :data_trainer
end
