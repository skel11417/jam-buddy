class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def show

  end

  def new
    #
    # use session instead of params?
    #
    redirect_to login_path unless params.include? :name
    @name = params[:name]
    @user = User.new
  end

  def create
    byebug
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
