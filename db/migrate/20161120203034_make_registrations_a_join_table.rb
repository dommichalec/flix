class MakeRegistrationsAJoinTable < ActiveRecord::Migration[5.0]
  # ran when we apply migrations
  def up
    Registration.delete_all
    remove_column(:registrations, :first_name)
    remove_column(:registrations, :last_name)
    remove_column(:registrations, :email)
    add_column(:registrations, :user_id, :integer)
  end

  # ran when we roll back migrations
  def down
    Registration.delete_all
    remove_column(:registrations, :user_id)
    add_column(:registrations, :first_name, :string)
    add_column(:registrations, :last_name, :string)
    add_column(:registrations, :email, :string)
  end
end
