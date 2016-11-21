class CreateFavorites < ActiveRecord::Migration[5.0]
# rails g resource favorite movie:references user:references
  def change
    create_table :favorites do |t|
      t.references :movie, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
