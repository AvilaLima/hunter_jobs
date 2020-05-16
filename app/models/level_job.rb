class LevelJob < ApplicationRecord
  has_many :jobs
  validates :level, uniqueness: true
  validates :level, presence: true
end
