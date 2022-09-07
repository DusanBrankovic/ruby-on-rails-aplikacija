class UserType < ApplicationRecord
  validates :key, presence: true, uniqueness: true
  validates :name, presence: true

  attr_readonly :key
end