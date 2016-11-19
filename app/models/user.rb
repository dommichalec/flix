class User < ApplicationRecord
  has_secure_password # attr_accessor :password, :password_confirmation
  # associations

  # constants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # validations
  validates :first_name, :last_name, presence: true
  validates :password, length: { minimum: 8, allow_blank: true }
  validates :email, format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }

  def full_name
    "#{first_name} #{last_name}"
  end
end
