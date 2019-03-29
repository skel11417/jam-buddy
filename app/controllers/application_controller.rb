class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :sanitize
  helper_method :current_user

  def sanitize
    Band.sanitize_bands
    Request.sanitize_requests
    Opening.sanitize_openings
  end

  def current_user
    user_id = session["user_id"]
    @current_user ||= User.find_by(id: user_id)
    return @current_user ? @current_user : nil
  end

  def destroy
    session.delete :user_id
  end

  private

  def require_login
    redirect_to login_path unless session.include? :user_id
  end
end
