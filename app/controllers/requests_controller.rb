class RequestsController < ApplicationController
  before_action :configure, only: :new

  def new
    @request = Request.new
  end

  def index
    Request.read_all(current_user.id)
    @requests = Request.sort_requests(current_user.id)
  end

  def create
    @request = Request.new(get_params)
    if inverse_redirect(@request)
      redirect_to requests_path
    elsif (@request.valid?)
      @request.save
      redirect_to requested_path
    else
      flash[:errors] = @request.errors.full_messages
      redirect_to requested_path
    end
  end

  def inverse_redirect(request)
    if (!!request.inverse_request)
      flash[:errors] = ["This user has already requested you!"]
      return true
    end
    return false
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
    status = @musician_status ? @musician_status : @request.musician_status
    if status == "pending"
      exit_path = !!@musician ? musician_path(@musician) : musician_path(@request.musician_id)
      return exit_path
    else
      exit_path = !!@opening ? opening_path(@opening) : opening_path(@request.opening_id)
      return exit_path
    end
  end

  def get_params
    params.require(:request).permit(:musician_id, :musician_status, :opening_id, :band_status, :message, :user_id, :read)
  end

  def configure
    flash[:errors] = []
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
      if (!has_openings?)
        flash[:errors] = ["You have no openings for this musician"]
        redirect_to requested_path
      end
    end
    if (is_same_user)
      flash[:errors] = ["You Cannot Request Your Own Account"]
      redirect_to send("#{@requested_type}_path", @requested)
    end
  end

  def has_openings?
    current_user.musician.managed_openings.length > 0
  end
end
