class CreateRegistrations < ActiveRecord::Migration[5.0]
# rails g resource registration first_name last_name email
# how_heard movie:references
  def change
    create_table :registrations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :how_heard
      t.references :movie, foreign_key: true # equivalent to t.integer :movie_id

      t.timestamps
    end
  end
end
