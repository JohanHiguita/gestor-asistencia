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

  end

  def update

  end

  def destroy
  end

  private

  def school_params
  params.require(:school).permit(:name, :user_id, :code,:ConsSede, :comuna) #solo permite estos datos

end
end
