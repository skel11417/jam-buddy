class MusiciansController < ApplicationController
  def index
    @musicians = Musician.all
  end

  def show
    get_musician
  end

  def new
    @musician = Musician.new
  end

  def create
    @musician = Musician.create(get_params) #configure strong params
    redirect_to @musician
  end

  def edit
    get_musician
  end

  def update
    get_musician.update(get_params)
    redirect_to @musician
  end

  def delete
    get_musician.destroy
    redirect_to musicians_path
  end

  private

  def get_musician
    @musician = Musician.find[params[:id]]
  end

  def get_params
    params.require(:musician).permit(:name, :bio, :availability, :location)
  end
end
