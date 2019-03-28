class RequestsController < ApplicationController
  before_action :configure, only: :new

  def new
    @request = Request.new
  end

  def index
    @requests = Request.sort_requests(current_user.id)
    @requests["musicians"].each { |r| r.read = true }
  end

  def create
    @request = Request.new(get_params)
    if (@request.valid?)
      @request.read = false
      @request.save
      redirect_to requested_path
    else
      redirect_to "/"
    end
  end

  def show
    get_request
  end

  def destroy
    get_request.destroy
    redirect_to requests_path
  end

  private

  def get_request
    @request = Request.find(params[:id])
  end

  def requested_path
    if @request.musician_status == "pending"
      return musician_path(@request.musician_id)
    else
      return opening_path(@request.opening_id)
    end
  end

  def get_params
    params.require(:request).permit(:musician_id, :musician_status, :opening_id, :band_status, :message, :user_id)
  end

  def configure
    if params["opening"] #musician requesting opening
      @requested_type = "opening"
      @opening = Opening.find(params["opening"])
      @musician = current_user.musician
      @requested = @opening
      @requester = @musician
      @musician_status = "interested"
      @band_status = "pending"
      is_same_user = @opening.user == current_user
    else #opening requesting musician
      @musician = Musician.find(params["musician"])
      @musician_status = "pending"
      @band_status = "interested"
      @requested = @musician
      @requester = "opening"
      @requested_type = "musician"
      is_same_user = @musician.user == current_user
    end
    if (is_same_user)
      flash[:error] = "You Cannot Request Your Own Account"
      redirect_to send("#{@requested_type}_path", @requested)
    end
  end
end
