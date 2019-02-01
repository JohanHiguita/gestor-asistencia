class AdminController < ApplicationController

  def index
  	@facilitadores = User.all
  	@schools = School.all
  	@sessions = ClassSession.all
  end

  #Facilitadores:
  def show_facilitador
  	@facilitador=User.find(params[:id])	
  end

  def destroy_facilitador
    facilitador = User.find(params[:id])
    #student_name = student.fullName
    facilitador.destroy
    flash[:notice]="El se ha eliminado el registro del facilitador"
    redirect_to admin_index_path
  end

  #Schools
  def show_school
  	@school=School.find(params[:id])	
  end

end
