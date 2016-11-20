class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def require_signin
    unless current_user
      session[:intended_url] = request.url # stores intended URL in session
      flash[:notice] = "Please sign in first!"
      redirect_to signin_url
    end
  end

  # if there's a session id, find the user and assign it to current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

  # makes the current_user method accessible to the views and helpers
  helper_method :current_user

  # checks to see if the current user is the user captured in the params hash
  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

  def require_correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to root_path
    end
  end

  def require_admin
    unless current_user_admin?
      redirect_to root_url, alert: "Unauthorized access!"
    end
  end

  def current_user_admin?
    current_user && current_user.admin?
  end

  helper_method :current_user_admin?
end
