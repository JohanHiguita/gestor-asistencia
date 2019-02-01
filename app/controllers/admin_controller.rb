class AdminController < ApplicationController

  def index
  	@facilitadores = User.all
  	@schools = School.all
  	@sessions = ClassSession.all
  end
end
