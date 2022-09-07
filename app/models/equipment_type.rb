class EquipmentType < ApplicationRecord
  belongs_to :equipment_type, optional: true

  has_many :equipment_equipment_type
  has_many :equipment, :through => :equipment_equipment_type, dependent: :delete_all


  validates :name, presence: true, uniqueness: true
end
