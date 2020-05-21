class Profile < ApplicationRecord
  has_one_attached:avatar
  belongs_to :user
  has_many :apply_jobs
  has_many :jobs, through: :apply_jobs
  has_many :comments


  validates :name, uniqueness: true
  validates :name,:birth_date, presence: true
end
