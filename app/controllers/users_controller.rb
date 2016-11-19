class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Flix, #{@user.first_name}!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params) # automatically calls @user.save which calls @user.valid?
      flash[:notice] = "Boom! You've successfully updated your account!"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @first_name = @user.first_name
    if @user.delete
      flash[:notice] = "Sorry to see you go, #{@first_name}!"
      redirect_to root_path
    else
      render 'show'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
                                 :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
