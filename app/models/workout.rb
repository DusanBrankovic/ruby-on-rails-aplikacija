class Workout < ApplicationRecord
  belongs_to :user

  has_many :workout_workout_type
  has_many :workout_type, :through => :workout_workout_type, dependent: :delete_all
  has_many :exercise
  
  validates :name, presence: true
  validates :description, presence: true
end
