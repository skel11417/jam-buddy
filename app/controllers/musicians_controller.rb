class MusiciansController < ApplicationController
  before_action :get_musician, only: [:show, :edit]

  def index
    @musicians = Musician.all
  end

  def show
  end

  def create
    @musician = Musician.create(musician_params) #configure strong params
    redirect_to @musician
  end

  def edit
    redirect_to musician_path(@musician) unless is_current_user?
  end

  def update
    get_musician.update(musician_params)
    redirect_to @musician, notice: "Your profile has been updated."
  end

  def delete
    get_musician.destroy
    redirect_to musicians_path
  end

  private

  def get_musician
    @musician = Musician.find(params[:id])
  end

  def musician_params
    params.require(:musician).permit(:name, :bio, :image_url, :availability, :location, instrument_ids: [], genre_ids: [])
  end

  def is_current_user?
    current_user == @musician.user
  end
end
