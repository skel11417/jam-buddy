class OpeningsController < ApplicationController
  before_action :get_opening, only: [:show, :edit, :update, :destroy]
  before_action :restrict_access, only: [:edit, :update, :destroy]

  def index
    @openings = Opening.all
  end

  def show
    get_opening
  end

  def new
    @opening = Opening.new
    @opening.band = Band.find(params[:band_id])
    redirect_to band_path(@opening.band) unless is_current_user?
  end

  def create
    @opening = Opening.create(get_params)
    redirect_to opening_path(@opening.id)
  end

  def edit
    get_opening
  end

  def update
    get_opening
    @opening.update(get_params)
    redirect_to @opening
  end

  def destroy
    @band = get_opening.band
    get_opening.destroy
    redirect_to @band
  end

  private

  def get_opening
    @opening = Opening.find(params[:id])
  end

  def get_params
    params.require(:opening).permit(:band_id, :instrument_id, :commitment, :description)
  end

  def is_current_user?
    @user = @opening.manager
    current_user == @user
  end

  def restrict_access
    get_opening
    redirect_to band_path(@opening.band) unless is_current_user?
  end
end
