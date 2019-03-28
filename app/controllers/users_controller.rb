class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :form_1]

  def show
    @bands = Band.where(musician_id: current_user.musician.id)
  end

  def suggest
    @musicians = Musician.suggest(current_user.id)
    @openings = Opening.suggest(current_user.id)
  end

  # form_1
  def form_1
    # This takes user input on the login page extend for
    # creating a new user and passes it to the session hash
    # before redirecting to the

    if valid_name? && valid_email?
      session[:username] = params[:username]
      session[:name] = params[:name]
      redirect_to new_user_path
    else
      redirect_to login_path
    end
  end
  def suggest
    @musicians = Musician.suggest(current_user.id)
    @openings = Opening.suggest(current_user.id)
  end

  def new
    @name = session[:name]
    @username = session[:username]
    @user = User.new
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

  private

  def valid_email?
    params[:username] && params[:username].match(URI::MailTo::EMAIL_REGEXP).present?
  end

  def valid_name?
    params[:name] && params[:name].length > 0
  end

  def new_user_params
    params.require(:user).permit(:username, :password, :musician_attributes => [:name, :location, :availabiity, :genre_ids, :instrument_ids])
  end
end
