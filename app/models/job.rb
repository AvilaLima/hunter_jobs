class Job < ApplicationRecord
  belongs_to :level_job
  validates :title, :summary,  :qualification,:salary,:location, :date_limit, 
            presence: true
  validate :date_limit_must_be_valid



  scope :search, -> (query){where('title LIKE ?', "%#{query}%")
                              .or(where(title: query))
                              .or(where('summary LIKE ?', "%#{query}%")) }
  private

  def date_limit_must_be_valid
    if date_limit.present? && date_limit <= Date.today
      errors.add(:date_limit, 'Não é uma data válida') 
    end
  end
end