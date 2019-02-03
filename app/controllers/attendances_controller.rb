require 'spreadsheet'

class AttendancesController < ApplicationController

	def show_modal

		@schools = School.where(user_id: current_user.id)
	end

	def download_xls
		generate_excel
		send_file(
			"#{Rails.root}/public/asistencia.xls",
			filename: "Asistencia_Digital.xls",
			type: "application/xls"
			)

	end

	def generate_excel
		#byebug
		book = Spreadsheet::Workbook.new
		sheet1 = book.create_worksheet
		sheet1.row(0).concat %w{Name Country Acknowlegement}
		sheet1[1,0] = 'Johan Esteban Higuita'
		sheet1[1,1] = 'From Colombia'
		sheet1[1,2] = 'Ruby on Rails'

		book.write "#{Rails.root}/public/asistencia.xls"
		
	end

end
