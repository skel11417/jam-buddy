class OpeningsController < ApplicationController
  def index
    @openings = Opening.all
  end

  def show
    get_opening
  end

  def new
    @opening = Opening.new
    @band = Band.find(params[:band_id])
  end

  def create
    @opening = Opening.create(get_params)
    redirect_to opening_path(@opening.id)
  end

  def edit
    get_opening
  end

  def update
    @opening = Opening.update(get_params)
    redirect_to @opening
  end

  def destroy
    get_opening
  end

  private

  def get_opening
    @opening = Opening.find(params[:id])
  end

  def get_params
    params.require(:opening).permit(:band_id, :instrument_id, :commitment, :description)
  end
end
