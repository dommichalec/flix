class AddCastDirectorAndDurationToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :cast, :string
    add_column :movies, :director, :string
    add_column :movies, :duration_in_minutes, :integer, default: 1
  end
end
