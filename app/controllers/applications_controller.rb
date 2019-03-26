class ApplicationsController < ApplicationController
  def index #should be filtered by user
    @applications = Application.all
  end

  def show
    get_application
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.create(get_params)
  end

  def delete
    get_application.destroy
    redirect_to applications_path
  end

  private

  def get_application
    @application = Application.find(params[:id])
  end

  def get_params
    params.require(:application).permit("?")  #requires application model
  end
end
