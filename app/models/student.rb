class Student < ApplicationRecord
  belongs_to :user
  belongs_to :school
  # has_many :sessions
end
