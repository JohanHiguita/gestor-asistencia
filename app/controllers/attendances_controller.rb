class AttendancesController < ApplicationController

	def show_modal
	
		@schools = School.where(user_id: current_user.id)
	end

	def download_xls
		byebug
	end

end
