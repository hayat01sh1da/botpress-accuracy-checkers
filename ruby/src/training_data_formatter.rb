# rbs_inline: enabled

require_relative './lib/format'

class TrainingDataFormatter
  include ::Lib::Format

  # @rbs path_to_csv_training_data: String
  # @rbs return: void
  def initialize(path_to_csv_training_data)
    @path_to_csv_training_data = path_to_csv_training_data
  end

  # @rbs path_to_json_training_data: String
  # @rbs return: void
  def export(path_to_json_training_data)
    File.write(filename(path_to_json_training_data), to_json(path_to_csv_training_data))
  end

  private

  attr_reader :path_to_csv_training_data

  # @rbs path_to_json_training_data: String
  # @rbs return: String
  def filename(path_to_json_training_data)
    File.join(path_to_json_training_data, "training_data_#{Time.now.strftime('%F%T').gsub(/[:\-]/, '')}.json")
  end
end
