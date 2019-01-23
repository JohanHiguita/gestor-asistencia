class ClassSessionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @sessions = Class_Session.where(user_id: current_user.id)
  end

  def new
    @session = Class_Session.new
    # @students = Student.where(user_id: current_user)
    @students = []
  end

  def create
    #byebug
    student_ids= params[:student_ids].values.map(&:to_i)
    #Field Time (separate in date and time)
    y = Time.parse(params[:date]).year
    m = Time.parse(params[:date]).month
    d = Time.parse(params[:date]).day
    hr = Time.parse(params[:timeHM]).hour
    min = Time.parse(params[:timeHM]).min
    time = Time.utc(y, m, d, hr, min)
    @session = Class_Session.new(class_session_params) #Create with number and school_id
    #Add the rest of fields
    @session.user_id = current_user.id
    @session.student_ids = student_ids
    @session.time = time

    if @session.save!
      flash[:notice]= "¡El estudiante se ha almacenado exitosamente!"
    else
      flash[:alert] = "Error al crear el estudiante"
    end
    redirect_to new_class_session_path
  end

  def edit
    @session=Class_Session.find(params[:id])
  end

def update
  @session = Class_Session.find(params[:id])

    # if @session.update(class_session_params)
    #   flash[:notice]= "¡El estudiante se ha almacenado exitosamente!"
    # else
    #   flash[:alert] = "Error al crear el estudiante"
    # end
    # redirect_to class_sessions_path
  end

  def show

  end

  def destroy
  end

  def students_selection
    @students = Student.where(school_id: params[:school_id]).order(:last_name_1)
    respond_to do |format|
     format.js {  }
    end
  end

 private

  def class_session_params
    params.require(:class_session).permit(:number, :user_id, :school_id, :student_ids) #solo permite estos datos
  end
end
