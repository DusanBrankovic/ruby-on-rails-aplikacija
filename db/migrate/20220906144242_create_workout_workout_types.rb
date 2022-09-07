class CreateWorkoutWorkoutTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_workout_types do |t|

      t.belongs_to :workout_type, foreign_key: true
      t.belongs_to :workout, foreign_key: true

      t.timestamps
    end
  end
end
