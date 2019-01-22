class Student < ApplicationRecord
  belongs_to :user
  belongs_to :school
  has_and_belongs_to_many :sessions

  def fullName
  	"#{self.first_name} #{self.middle_name} #{self.last_name_1} #{self.last_name_2}"
  end
end
