class ApplicationController < ActionController::Base
  before_action :require_login
  


  helper_method :current_user

  def current_user
      user_id = session["user_id"]
      @current_user ||= User.find_by(id: user_id)
      return @current_user ? @current_user : nil
  end

  def destroy
    session.delete :username
  end

  private

  def require_login
    redirect_to login_path unless session.include? :user_id
  end
end
