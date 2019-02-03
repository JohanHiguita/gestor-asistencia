class AdminClassSessionsController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@sessions = ClassSession.all
  end

  def show
  	@session=ClassSession.find(params[:id])
  end
end
