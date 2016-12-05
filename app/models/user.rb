class User < ApplicationRecord
  has_secure_password # attr_accessor :password, :password_confirmation
  # associations
  has_many :registrations, dependent: :destroy # if user is destroyed it only
  # makes sense to destroy the user's registrations as well.
  has_many :favorites, dependent: :destroy
  # same as has_many :movies, through: :favorites
  has_many :favorite_movies, through: :favorites, source: :movie
  # constants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # validations
  validates :first_name, :last_name, presence: true
  validates :password, length: { minimum: 8, allow_blank: true }
  validates :email, format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }

  # use custom query scopes to dynamically define class methods
  scope :by_last_name, -> { order(:last_name) }
  scope :by_updated_on, lambda { order(:updated_at)}
  scope :not_admins, -> { by_last_name.where(admin: false) }

  # class methods
  def self.confirm(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end

  # instance methods
  def full_name
    "#{first_name} #{last_name}"
  end
end
