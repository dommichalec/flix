class Movie < ApplicationRecord
  # associations
  has_many :registrations, dependent: :destroy # parent to child Registration
  # and destroys all registrations when it is destroyed itself from the db.
  has_many :favorites, dependent: :destroy
  # same as has_many :users, through: :favorites
  has_many :fans, through: :favorites, source: :user
  # validations
  validates :title, presence: true
  validates :cast, presence: true
  validates :director, presence: true
  validates :rating, length: { in: 1..5 }
  validates :duration_in_minutes, numericality: { greater_than_or_equal: 0 }
  validates :total_gross, numericality: { greater_than_or_equal: 0 }
  validates :description, length: { in: 1..500 }
  # depends on the gem 'date_validator'
  validates :released_on,
          date: { after: Proc.new { Time.now - 116.year },
                  before: Proc.new { Time.now + 5.year },
                  message: 'date must be valid (between 1900 and 2021) ' }

  # use custom query scopes to dynamically define class methods
  scope :released, lambda { where("released_on <= ?", Time.now).order("released_on desc") }
  scope :upcoming, lambda { where("released_on >= ?", Time.now).order("released_on asc")}
  scope :rated, ->(rating) { released.where(rating: rating) }
  scope :recent, ->(max=5) { released.limit(max) }
  scope :hits, lambda { where('total_gross >= 300000000').order(total_gross: :desc) }
  scope :flops, lambda { where('total_gross <= 50000000').order(total_gross: :asc) }
  scope :released_hits, lambda { released.where('total_gross >= 300000000').order(total_gross: :desc) }
  scope :released_flops, lambda { released.where('total_gross <= 300000000').order(total_gross: :desc)}
  # scope :rated, lambda(rating) { released.where(rating: rating) }

  # class methods

  # selects movies that've already been released and orders them
  # in descending release date (stating with most recently released)

  # def self.released
    # where("released_on <= ?", Time.now).order("released_on desc")
  # end

  # selects movies that haven't come out yet

  # def self.upcoming
    # where("released_on >=", Time.now)
  # end

  # def self.hits
    # where('total_gross >= 300000000').order(total_gross: :desc)
  # end

  # def self.flops
    # where('total_gross < 50000000').order(total_gross: :asc)
  # end

  # instance methods

  # defines whether or not a movie is a flop
  def flop?
    total_gross <= 50000000
  end
end
