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
    flash[:errors] = nil
    @opening = Opening.new(get_params)
    if (@opening.valid?)
      @opening.save
      redirect_to opening_path(@opening.id)
    else
      flash[:errors] = @opening.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    flash[:errors] = nil
    if (@opening.update(get_params))
      redirect_to @opening
    else
      flash[:errors] = @opening.errors.full_messages
      render :edit
    end
  end

  def destroy
    @band = @opening.band
    @opening.destroy
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
