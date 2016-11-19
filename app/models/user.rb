class User < ApplicationRecord
  has_secure_password
  # associations

  # validations
  validates :first_name, :last_name
  validates :email, presence: true,
    format: /\A\S+@\S\z/, uniqueness: { case_sensitive: false }
end
