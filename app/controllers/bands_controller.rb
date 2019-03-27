class BandsController < ApplicationController
  before_action :restrict_access, only: [:edit, :update, :destroy]
  before_action :get_band, only: [:show, :edit, :update, :destroy]

  def index
    @bands = Band.all
  end

  def index_by_user
    @bands = Band.where(musician_id: current_user.musician.id)
    if (@bands.length > 0)
      render "index"
    else
      redirect_to new_band_path
    end
  end

  def show
  end

  def new
    @band = Band.new
    @band.musician = current_user.musician  #This should be the user, but for now it will be a random manager
  end

  def create
    @band = Band.create(get_params)
    redirect_to @band
  end

  def edit
  end

  def update
    @band.update(get_params)
    redirect_to @band
  end

  def destroy
    @band.destroy
    redirect_to bands_path
  end

  private

  def get_band
    @band = Band.find(params[:id])
  end

  def get_params
    params.require(:band).permit(:musician_id, :name, :image_url, :status, :link, :location, genre_ids: [])
  end

  def is_current_user?
    @user = get_band.manager
    current_user == @user
  end

  def restrict_access
    get_band
    redirect_to band_path(@band) unless is_current_user?
  end
end
