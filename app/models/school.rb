class School < ApplicationRecord
  belongs_to :user
  has_many :students
  # has_many :sessions
  

end
