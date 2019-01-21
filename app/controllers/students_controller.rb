class StudentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @students = Student.where(user_id: current_user.id)

  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
