class Exercise < ApplicationRecord
  belongs_to :workout

  has_many :exercise_equipment
  has_many :equipment, :through => :exercise_equipment, dependent: :delete_all
end
