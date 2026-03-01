class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Redirects to the login page if no user is logged in.
  # Used to restrict access to actions that require a logged-in user.
  # @example
  #   class MyController < ApplicationController
  #     before_action :require_login
  #
  #     def my_action
  #       # Only runs if user is logged in
  #     end
  #   end
  def require_login
    redirect_to login_path, alert: "You must be logged in." unless current_user
  end

  private

  # Returns the User object associated with the current session, or nil if no session user is logged in.
  # @return [User, nil]
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user
end
