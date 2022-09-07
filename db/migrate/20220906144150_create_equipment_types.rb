class CreateEquipmentTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment_types do |t|
      t.belongs_to :equipment_type, foreign_key: true

      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
