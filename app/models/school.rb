class School < ApplicationRecord

	belongs_to :user
	has_many :students, dependent: :destroy
	has_many :class_sessions, dependent: :destroy
	
	def getName
		self.name
	end

end
