class TrainingDataForm < ApplicationForm
  attr_accessor :training_data
  validates :training_data, presence: true
end
