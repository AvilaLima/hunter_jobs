class Job < ApplicationRecord
  belongs_to :level_job
  has_many :apply_jobs
  has_many :profiles, through: :apply_jobs
  validates :title, :summary,  :qualification,:salary,:location, :date_limit, 
            presence: true
  validate :date_limit_must_be_valid

  enum status: {open:0, closed: 5}

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