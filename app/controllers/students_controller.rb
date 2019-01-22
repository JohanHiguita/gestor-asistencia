class StudentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @students = Student.where(user_id: current_user.id)

  end

  def show
  end

  def new
    @student=Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    @student.user = current_user
    if @student.save
      flash[:notice]= "¡El estudiante se ha almacenado exitosamente!"
    else
      @topics=Topic.all
      flash[:alert] = "Error al crear el estudiante"
    end
    redirect_to new_student_path
  end

  def update
  end

  def destroy
  end


  private

  def student_params
  params.require(:student).permit(:first_name, :middle_name, :last_name_1,:last_name_2, :cc, :grade, :age, :tel, :observations, :school_id, :user_id) #solo permite estos datos

  end
end
