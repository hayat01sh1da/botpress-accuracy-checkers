# rbs_inline: enabled

require_relative './lib/format'

class TrainingDataFormatter
  include ::Lib::Format

  # @rbs csv_training_data: String
  # @rbs return: void
  def initialize(csv_training_data)
    @csv_training_data = csv_training_data
  end

  # @rbs dirname: String
  # @rbs return: void
  def export(dirname)
    File.write(filename(dirname), to_json(csv_training_data))
  end

  private

  attr_reader :csv_training_data

  # @rbs dirname: String
  # @rbs return: String
  def filename(dirname)
    File.join(dirname, "training_data_#{Time.now.strftime('%F%T').gsub(/[:\-]/, '')}.json")
  end
end
