class AddIndexToMovies < ActiveRecord::Migration[5.0]
  # improves READ queries on director column
  def change
    add_index(:movies, :director)
  end
end
