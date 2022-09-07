class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|

      t.belongs_to :workout, foreign_key: true

      t.integer :reps
      t.string :name
      t.text :description
      t.integer :rest_time

      t.timestamps
    end
  end
end
