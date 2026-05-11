# rbs_inline: enabled

require_relative './lib/format'

class DataTrainer
  include ::Lib::Format

  # @rbs data_trainer: String
  # @rbs return: void
  def initialize(data_trainer)
    @data_trainer = data_trainer
  end

  # @rbs dirname: String
  # @rbs return: void
  def export(dirname)
    File.write(filename(dirname), to_json(data_trainer))
  end

  private

  attr_reader :data_trainer

  # @rbs dirname: String
  # @rbs return: String
  def filename(dirname)
    File.join(dirname, "training_data_#{Time.now.strftime('%F%T').gsub(/[:\-]/, '')}.json")
  end
end
