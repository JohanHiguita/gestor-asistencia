class AdminController < ApplicationController

  def index
  	@facilitadores = User.all
  	@schools = School.all
  	@sessions = ClassSession.all
  end

  def show_facilitador
  	@facilitador=User.find(params[:id])	
  end

end
