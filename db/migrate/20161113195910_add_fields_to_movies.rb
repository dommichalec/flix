class AddFieldsToMovies < ActiveRecord::Migration[5.0]
  # rails g migration add AddAttributesToMovies description:text released_on:date
  def change
    # this migration will add columns to the movies table
    add_column :movies, :description, :text
    add_column :movies, :released_on, :date
  end
end
