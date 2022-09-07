class Equipment < ApplicationRecord
  has_many :equipment_equipment_type
  has_many :equipment_type, :through => :equipment_equipment_type, dependent: :delete_all

  validates :name, presence: true
end
