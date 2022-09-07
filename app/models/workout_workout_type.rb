class WorkoutWorkoutType < ApplicationRecord
  belongs_to :workout
  belongs_to :workout_type
end
