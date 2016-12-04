# an action is simply a publicly-accessible Ruby method defined in a
# controller class.

# rails g controller movies
class MoviesController < ApplicationController

  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

  # gets every movie record in the db and sets them equal to @flix
  def index
    @flix = Movie.released
  end

  # gets movie based on id value in URL params hash and sets it equal to @movie
  def show
    @movie = Movie.find(params[:id])
    @fans = @movie.fans
    
    if current_user
      @current_favorite = current_user.favorites.find_by(movie_id: @movie.id)
    end
  end

  # gets movie based on id value in URL params hash for editing purposes
  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params) # automatically returns true if validate
      flash[:notice] = "#{@movie.title} has been successfully updated!"
      redirect_to movie_path(@movie)
    else
      render 'edit' # redisplays form
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save # automatically runs @movie.valid?
      flash[:notice] = "#{@movie.title} was successfully added!"
      redirect_to movies_path
    else
      render 'new' # redisplays form
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

  def require_admin
    unless current_user_admin?
      flash[:notice] = "Sorry, you do not have access to that action."
      redirect_to root_path
    end
  end
end
