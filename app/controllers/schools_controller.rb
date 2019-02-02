class SchoolsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @schools = School.all
  end

  def show
    @school=School.find(params[:id])
  end

  def new
   @school=School.new
 end

 def edit
  @school=School.find(params[:id])
end

def create

  @school = School.new(school_params)
  
  if @school.save!
    flash[:notice]= "¡La instutución se ha guardado exitosamente!"
  else
    flash[:alert] = "Error al crear la institución"
  end
  redirect_to new_school_path
end

def update
  @school=School.find(params[:id])
  if @school.update(school_params)
    flash[:notice]= "¡El registro ha sido modificado exitosamente!"
    redirect_to schools_path
  else
    flash[:alert] = "Error al editar el registro de la institución"
    render :edit
  end

end

def destroy
  school = School.find(params[:id])
  school.destroy
  flash[:notice]="Se ha eliminado el registro de la institución"
  redirect_to schools_path
end


private

def school_params
  params.require(:school).permit(:name, :user_id, :code,:ConsSede, :comuna, :level) #solo permite estos datos

end
end
