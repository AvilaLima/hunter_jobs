class Profile < ApplicationRecord
  has_one_attached:avatar
  has_one :user
  has_many :apply_jobs
  has_many :jobs, through: :apply_jobs

  validates :name, uniqueness: true
  validates :name,:birth_date, presence: true
end
