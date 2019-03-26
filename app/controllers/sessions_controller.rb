class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :new]

  def create
    @user = User.find_by(username: params[:username])
    # edge case: user misspells username and @user = nil

    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to musicians_path
  end

# new ??
  def new

  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end
