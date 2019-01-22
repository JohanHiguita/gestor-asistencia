class ClassSessionsController < ApplicationController
  before_action :authenticate_user!

  def index
     @sessions = Class_Session.where(user_id: current_user.id)

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end
