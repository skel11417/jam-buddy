class MusiciansController < ApplicationController
  before_action :get_musician, only: [:show, :edit]
  def index
    @musicians = Musician.all
  end

  def show
  end

  def new
    @musician = Musician.new
  end

  def create
    @musician = Musician.create(get_params) #configure strong params
    redirect_to @musician
  end

  def edit
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
    @musician = Musician.find(params[:id])
  end

  def get_params
    params.require(:musician).permit(:name, :bio, :availability, :location)
  end
end
