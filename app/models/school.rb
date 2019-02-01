class School < ApplicationRecord

	belongs_to :user
	has_many :students, dependent: :destroy
	has_many :class_sessions, dependent: :destroy
	
	def getName
		self.name
	end

	def students_avg
		sessions = self.class_sessions
		total_students = 0
		sessions.each do |session|
			total_students += session.students.count
		end
		total_sessions = self.class_sessions.count
		(total_students.to_f/ total_sessions).round(1) 

	end

end
