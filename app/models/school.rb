class School < ApplicationRecord

	belongs_to :user
	has_many :students
	has_many :class_sessions
	
	def getName
		self.name
	end

end
