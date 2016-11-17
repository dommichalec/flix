class AddIndexToMovies < ActiveRecord::Migration[5.0]
  # rails g migration AddIndexToDirector
  # improves READ queries on director column
  def change
    add_index(:movies, :director)
  end
end
