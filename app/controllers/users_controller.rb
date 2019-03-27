class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def show

  end

  def new
    #
    # use session instead of params?
    #
    if params[:name].length > 0
      @name = params[:name]
      @user = User.new
    else
      redirect_to login_path
    end
  end

  def create
    @user = User.create(new_user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to musician_path(@user.musician)
    else
      render "new"
    end
  end

  # private

  def new_user_params
    params.require(:user).permit(:username, :password, :musician_attributes => [:name, :location, :availabiity, :genre_ids, :instrument_ids])
  end

end
