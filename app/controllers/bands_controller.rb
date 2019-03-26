class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def show
    get_band
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.create(get_params)
    redirect_to @band
  end

  def edit
    get_band
  end

  def update
    get_band.update(get_params)
    redirect_to @band
  end

  def delete
    get_band.destroy
    redirect_to bands_path
  end

  private

  def get_band
    @band = Band.find[params[:id]]
  end

  def get_params
    params.require(:band).permit(:musician_id, :name, :image_url, :status, :link)
  end
end
