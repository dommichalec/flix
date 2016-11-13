# rails g controller movies
class MoviesController < ApplicationController

  # an action is simply a publicly-accessible Ruby method defined in a
  # controller class.

  def index
    @flix = ['Up', 'Toy Story', 'Iron Man', 'The Incredibles']
  end
end
