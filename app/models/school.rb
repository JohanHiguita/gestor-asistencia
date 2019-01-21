class School < ApplicationRecord

	belongs_to :user
	has_many :students
  # has_many :sessions
  
  def name_with_initial
  	this.name
  end

end
