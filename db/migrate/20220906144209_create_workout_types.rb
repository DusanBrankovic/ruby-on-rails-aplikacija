class CreateWorkoutTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_types do |t|

      t.belongs_to :workout, foreign_key: false

      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
