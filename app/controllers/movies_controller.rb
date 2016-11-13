# an action is simply a publicly-accessible Ruby method defined in a
# controller class.

# rails g controller movies
class MoviesController < ApplicationController

  # gets every movie record in the db and sets them equal to @flix
  def index
    @flix = Movie.all
  end

  # gets movie based on id value in URL params hash and sets it equal to @movie
  def show
    @movie = Movie.find(params[:id])
  end
end
