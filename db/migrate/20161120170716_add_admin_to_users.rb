class AddAdminToUsers < ActiveRecord::Migration[5.0]
# rails g migration AddAdminToUsers admin:boolean
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
