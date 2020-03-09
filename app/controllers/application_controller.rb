class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Redirecting unauthorized user to root
  def reject_user
    redirect_to root_path, alert: 'Unauthorized action!'
  end
end
