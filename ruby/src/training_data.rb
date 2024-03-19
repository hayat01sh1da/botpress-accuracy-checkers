require_relative './lib/format'

class TrainingData
  include ::Lib::Format

  def initialize(training_data)
    @training_data = training_data
  end

  def export(dirname)
    File.open(filename(dirname), 'w') { |f| f.write(to_json(training_data)) }
  end

  private

  attr_reader :training_data

  def filename(dirname)
    File.join(dirname, "training_data_#{Time.now.strftime('%F%T').gsub(/[:\-]/, '')}.json")
  end
end
