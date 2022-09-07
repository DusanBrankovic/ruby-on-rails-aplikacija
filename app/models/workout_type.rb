class WorkoutType < ApplicationRecord
  belongs_to :workout_type, optional: true

  has_many :workout_workout_type
  has_many :workout_type, :through => :workout_workout_type, dependent: :delete_all

  validates :name, presence: true , uniqueness: true
end
