class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :new]

  def create
    @user = User.find_by(username: params[:username])
    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to musician_path(@user.musician)
      else
        flash[:errors] = ["Invalid Username/Password"]
        redirect_to musicians_path
      end
    else
      flash[:notice] = "The user does not exist"
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end

#  return head(:forbidden) unless
