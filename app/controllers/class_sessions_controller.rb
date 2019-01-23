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
    #  @session = Class_Session.new(class_session_params)

    # if @session.save
    #   flash[:notice]= "¡El estudiante se ha almacenado exitosamente!"
    # else
    #   flash[:alert] = "Error al crear el estudiante"
    # end
    # redirect_to new_class_session_path
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
    @students = Student.where(school_id: params[:school_id])
    respond_to do |format|
     format.js {  }
   end

 end

 private

 def class_session_params
  params.require(:class_session).permit(:number, :user_id, :school_id, :date, :timeHM) #solo permite estos datos

end
end
