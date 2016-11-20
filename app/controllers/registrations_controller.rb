class RegistrationsController < ApplicationController
  before_action :set_movie, only: [:index, :new, :create]
  before_action :require_signin

  def index
    @registrations = @movie.registrations
  end

  def new
    @registration = @movie.registrations.new
  end

  def create
    @registration = @movie.registrations.new(registration_params)
    @registration.user = current_user
    if @registration.save
      flash[:notice] = "Awesome! You're registered for #{@movie.title}!"
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:how_heard)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
