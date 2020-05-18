class ApplyJob < ApplicationRecord
  belongs_to :profile
  belongs_to :job

  validates :cover_letter, presence: true

  enum status: {open:0, closed: 5}
end
