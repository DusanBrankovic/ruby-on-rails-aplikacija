class CreateExerciseEquipments < ActiveRecord::Migration[6.1]
  def change
    create_table :exercise_equipments do |t|
      t.belongs_to :exercise, foreign_key: true
      t.belongs_to :equipment, foreign_key: true

      t.timestamps
    end
  end
end
