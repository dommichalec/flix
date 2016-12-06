class FavoritesController < ApplicationController
  before_action :require_signin
  before_action :set_movie

  def create
    @movie.favorites.create!(user: current_user)
    flash[:notice] = "Thanks for liking this movie!"
    redirect_to movie_path(@movie)

    current_user.favorites.find_by(movie_id: @movie.id)
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy

    flash[:notice] = "Sorry you don't like this movie, anymore!"
    redirect_to movie_path(@movie)
  end

  private

  def set_movie
    @movie = Movie.find_by!(slug: params[:id])
  end
end
