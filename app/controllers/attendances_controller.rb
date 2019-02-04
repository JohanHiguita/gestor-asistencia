require 'spreadsheet'

class AttendancesController < ApplicationController

	def show_modal

		@schools = School.where(user_id: current_user.id)
	end

	def download_xls
		school_id = params[:school]
		week = params[:week]
		school_code = School.find(school_id).code
		generate_excel school_id, week
		#render js: "$('#generate-assistance-modal').modal('hide');"
		send_file(
			"#{Rails.root}/public/asistencia.xls",
			filename: "ASISTENCIA DIGITAL SEM#{week} #{school_code}.xls",
			type: "application/xls"
			)
	end

	def generate_excel school_id, week
		#byebug
		book = Spreadsheet::Workbook.new
		sheet1 = book.create_worksheet
		#sheet1.row(0).concat %w{C Country Acknowlegement}
		sheet1.row(0).replace [
			"CONS SEDE",
			"SEDE EDUCATIVA",
			"COMUNA",
			"TIPO DE DOCUMENTO",
			"NRO DE DOCUMENTO",
			"PRIMER NOMBRE",
			"SEGUNDO NOMBRE",
			"PRIMER APELLIDO",
			"SEGUNDO APELLIDO",
			"TELÉFONO",
			"GRADO",
			"RUTA EDUCACIÓN COMPLEMENTARIA",
			"PROYECTO EDUCACIÓN COMPLEMENTARIA",
			"MES DE INFORME",
			"SEMANA DE INFORME",
			"SESIONES PROYECTADAS",
			"SESIONES EJECUTADAS",
			"ASISTENCIA ESTUDIANTE",
			"'%' DE ASISTENCIA A LAS SESIONES",
			"CAUSAS DE INASISTENCIA",
			"OBSERVACIONES"		
		]

		#Formatting
		# format = Spreadsheet::Format.new :color => :blue,
		# :weight => :bold,
		# :size => 18
		# sheet1.row(0).default_format = format

		#Necessary arrays:
		sessions = ClassSession.where(week: week).where(school_id: school_id)
		students = School.find(school_id).students
		ids = [] #students ids in sessions of the week (repeated)
		sessions.each do |session|
			ids += session.student_ids
		end
		#Commun values:
		school = School.find(school_id)
		cons_sede = school.ConsSede
		sede_educativa = school.name
		comuna = school.comuna
		tipo_documento = "Tarjeta de Identidad"
		ruta_educacion = "CIENCIA_Y_TECNOLOGÍA"
		proyecto_educacion = "ROBÓTICA"
		mes_informe = params[:month]
		sesiones_proyectadas = 2
		sesiones_ejecutadas = sessions.count
		semana_informe = week


		#Fill excel in
		students.each_with_index { |student, index|
			row = [
				cons_sede.to_s,
				sede_educativa,
				comuna,
				tipo_documento,
				student.cc.to_s,
				student.first_name,
				student.middle_name,
				student.last_name_1,
				student.last_name_2,
				student.tel,
				student.grade,
				ruta_educacion,
				proyecto_educacion,
				mes_informe,
				semana_informe,
				sesiones_proyectadas,
				sesiones_ejecutadas,
				ids.count(student.id),
				"#{( (ids.count(student.id).to_f/sesiones_ejecutadas)*100 ).to_i}%",
				student.observations
			]
			sheet1.row(index + 1).replace row
		} 

		book.write "#{Rails.root}/public/asistencia.xls"
		
	end

end
