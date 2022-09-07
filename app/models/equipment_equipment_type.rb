class EquipmentEquipmentType < ApplicationRecord
  belongs_to :equipment
  belongs_to :equipment_type
end
