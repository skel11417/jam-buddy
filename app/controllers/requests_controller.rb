class RequestsController < ApplicationController
  def index #should be filtered by user
    @requests = Request.all
  end

  def show
    get_request
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.create(get_params)
  end

  def delete
    get_request.destroy
    redirect_to requests_path
  end

  private

  def get_request
    @request = Request.find(params[:id])
  end

  def get_params
    params.require(:request).permit("?")  #requires request model
  end
end
