class Profile < ApplicationRecord
  has_one_attached:avatar
  validates :name, uniqueness: true
  validates :name,:birth_date, presence: true
end
