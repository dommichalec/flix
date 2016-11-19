class User < ApplicationRecord
  has_secure_password # attr_accessor :password, :password_confirmation
  # associations

  # constants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # validations
  validates :first_name, :last_name, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
end
