class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def show
    get_band
  end

  def new
    @band = Band.new
    @band.musician = Musician.all.sample  #This should be the user, but for now it will be a random manager
  end

  def create
    @band = Band.create(get_params)
    params[:band][:genre_ids].each do |g|
      @band.genres << Genre.find(g)
    end
    redirect_to @band
  end

  def edit
    get_band
  end

  def update
    get_band.update(get_params)
    redirect_to @band
  end

  def destroy
    get_band.destroy
    redirect_to bands_path
  end

  private

  def get_band
    @band = Band.find(params[:id])
  end

  def get_params
    params.require(:band).permit(:musician_id, :name, :image_url, :status, :link, :location, :genre_ids => [])
  end
end
