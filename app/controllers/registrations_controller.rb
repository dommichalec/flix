class RegistrationsController < ApplicationController

  def index
    @movie = Movie.find(params[:movie_id])
    @registrations = @movie.registrations
  end
end
