class CreateWorkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :workouts do |t|

      t.belongs_to :user, foreign_key: true

      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
