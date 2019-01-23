class StudentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @students = Student.where(user_id: current_user.id)

  end

  def show
    @student=Student.find(params[:id])
  end

  def new
    @student=Student.new
  end

  def edit
    @student=Student.find(params[:id])
  end

  def create
    @student = Student.new(student_params)
    @student.user = current_user
    if @student.save
      flash[:notice]= "¡El estudiante se ha almacenado exitosamente!"
    else
      flash[:alert] = "Error al crear el estudiante"
    end
    redirect_to new_student_path
  end

  def update
    @student=Student.find(params[:id])
    if @student.update(student_params)
      flash[:notice]= "¡El registro ha sido modificado exitosamente!"
      redirect_to students_path
    else
      flash[:alert] = "Error al editar el registro del estudiante"
      render :edit
    end
  end

  def destroy
  end


  private

  def student_params
  params.require(:student).permit(:first_name, :middle_name, :last_name_1,:last_name_2, :cc, :grade, :age, :tel, :observations, :school_id, :user_id) #solo permite estos datos

end
end
