class Profile < ApplicationRecord

  validates :name, uniqueness: { message: 'deve ser único'}
  validates :name, presence: { message: 'não pode ficar em branco'}
  validates :birth_date, presence: 
              { message: 'não pode ficar em branco'}
end
