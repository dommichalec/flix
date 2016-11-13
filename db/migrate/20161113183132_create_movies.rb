class CreateMovies < ActiveRecord::Migration[5.0]
  # denotes what kind of change we'll be making to the db
  def change
    # this migration will create the movies table
    create_table :movies do |t|
      t.string :title
      t.string :rating
      t.decimal :total_gross

      # t.timestamps is a shortcut that ends up creating two additional
      # columns: created_at and updated_at
      t.timestamps
    end
  end
end
