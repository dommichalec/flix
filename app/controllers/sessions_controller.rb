class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.confirm(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.first_name}!"
      redirect_to(session[:intended_url] || user_path(user))
      session[:intended_url] = nil
    else
      flash.now[:notice] = "Doh! That email/password combo is invalid!"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You're all signed out!"
  end

end
