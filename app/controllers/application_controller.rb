class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to login_path, alert: "You must be logged in." unless current_user
  end

  helper_method :current_user
end
