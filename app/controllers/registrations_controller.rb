class RegistrationsController < ApplicationController
  before_action :set_movie, only: [:index, :new, :create]

  def index
    @registrations = @movie.registrations
  end

  def new
    @registration = @movie.registrations.new
  end

  def create
    @registration = @movie.registrations.new(registration_params)
    if @registration.save
      flash[:notice] = "Awesome! You're registered for #{@movie.title}!"
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:first_name, :last_name,
                                         :email, :how_heard)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
