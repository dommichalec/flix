class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  # if there's a session id, find the user and assign it to current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

  def require_signin
    unless current_user
      flash[:notice] = "Please sign in first!"
      redirect_to signin_url
    end
  end

  # makes the current_user method accessible to the views and helpers
  helper_method :current_user
end
