class Profile < ApplicationRecord
  has_one_attached:avatar
  has_one :user
  validates :name, uniqueness: true
  validates :name,:birth_date, presence: true
end
