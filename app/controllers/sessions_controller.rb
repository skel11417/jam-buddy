class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :new]

  def create
    @user = User.find_by(username: params[:username])
    if @user
      return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "nuh uh"
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end
