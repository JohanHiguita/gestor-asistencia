class ClassSession < ApplicationRecord
	belongs_to :user
	belongs_to :school
	has_and_belongs_to_many :students

	def showDate
		(self.time).strftime "%d-%m-%Y"  		
	end

	def showTime
		(self.time).strftime "%H:%M"
	end

	def week
		((self.time).strftime  "%W").to_i + 1
		
	end
end
