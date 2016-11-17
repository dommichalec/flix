class AddAttribuesToRegistrations < ActiveRecord::Migration[5.0]
  # rails g migration AddAttribuesToRegistrations city:string state:string
  def change
    add_column :registrations, :city, :string
    add_column :registrations, :state, :string
  end
end
