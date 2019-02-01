class AdminController < ApplicationController

  def index
  	@facilitadores = User.all
  	@session = ClassSession.all
  end
end
