class ApplyJob < ApplicationRecord
  belongs_to :profile
  belongs_to :job

  validates :cover_letter, presence: true

  enum status: {pending:0, denied:5, accepted:10}
end

