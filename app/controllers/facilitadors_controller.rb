class FacilitadorsController < ApplicationController

	before_action :authenticate_admin!
	
	def index
		#byebug
		@facilitadores = User.all

	end


	def show
		#byebug
		@facilitador=User.find(params[:id])

	end

	def destroy
		facilitador = User.find(params[:id])
    	#student_name = student.fullName
    	facilitador.destroy
    	flash[:notice]="Se ha eliminado el registro del facilitador"
    	redirect_to facilitadors_path
    end
end
