class AdminController < ApplicationController

  def index
  	@facilitadores = User.all
  	@schools = School.all
  end
end
