class UsersController < ApplicationController
  def show
    @bands = Band.where(musician_id: current_user.musician.id)
  end
end
