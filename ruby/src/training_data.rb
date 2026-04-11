# rbs_inline: enabled

require_relative './lib/format'

class TrainingData
  include ::Lib::Format

  # @rbs training_data: String
  # @rbs return: void
  def initialize(training_data)
    @training_data = training_data
  end

  # @rbs dirname: String
  # @rbs return: void
  def export(dirname)
    File.write(filename(dirname), to_json(training_data))
  end

  private

  attr_reader :training_data

  # @rbs dirname: String
  # @rbs return: String
  def filename(dirname)
    File.join(dirname, "training_data_#{Time.now.strftime('%F%T').gsub(/[:\-]/, '')}.json")
  end
end
