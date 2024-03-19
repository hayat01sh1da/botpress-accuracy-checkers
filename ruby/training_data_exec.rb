require_relative './src/training_data'

csv_training_data = File.join('..', 'csv', 'training_data.csv')
dirname           = File.join('..', 'json')

training_data = TrainingData.new(csv_training_data)
training_data.export(dirname)
puts "--- Successfully exported JSON training data under #{dirname}/ ---"
