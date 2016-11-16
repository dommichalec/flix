# an action is simply a publicly-accessible Ruby method defined in a
# controller class.

# rails g controller movies
class MoviesController < ApplicationController

  # gets every movie record in the db and sets them equal to @flix
  def index
    @flix = Movie.released
  end

  # gets movie based on id value in URL params hash and sets it equal to @movie
  def show
    @movie = Movie.find(params[:id])
  end

  # gets movie based on id value in URL params hash for editing purposes
  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to movie_path(@movie)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.valid?
      @movie.save
      flash[:success] = "#{@movie.title} was successfully added!"
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.delete
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :rating, :total_gross, :description,
                          :released_on, :cast, :director, :duration_in_minutes)
  end
end
