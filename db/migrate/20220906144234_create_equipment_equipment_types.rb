class CreateEquipmentEquipmentTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment_equipment_types do |t|
      t.belongs_to :equipment_type, foreign_key: true
      t.belongs_to :equipment, foreign_key: true

      t.timestamps
    end
  end
end
