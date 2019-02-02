class SchoolsController < ApplicationController
  def index
  end

  def show
    @school=School.find(params[:id])
  end

  def new
   @school=School.new
 end

 def edit
 end

 def create
  byebug
  @school = School.new(school_params)
  
  if @school.save!
    flash[:notice]= "¡La instutución se ha guardado exitosamente!"
  else
    flash[:alert] = "Error al crear la institución"
  end
  redirect_to new_school_path
end

def update

end

def destroy
end

private

def school_params
  params.require(:school).permit(:name, :user_id, :code,:ConsSede, :comuna, :level) #solo permite estos datos

end
end
