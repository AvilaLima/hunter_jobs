class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  enum role: {candidate:0, headhunter: 5}

  #rental.candidate?
  #rental.headhunter?
  #rental.scheduled volta todas scheduled
  #rental.status volta scheduled ou ongoing
end
