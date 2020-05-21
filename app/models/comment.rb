class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :profile

  validates :message, presence: true
end
