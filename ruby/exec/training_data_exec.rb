# rbs_inline: enabled

require_relative '../src/data_trainer'

csv_training_data = File.join('..', 'csv', 'training_data.csv')
dirname           = File.join('..', 'json')

data_trainer = DataTrainer.new(csv_training_data)
data_trainer.export(dirname)
puts "--- Successfully exported JSON training data under #{dirname}/ ---"
