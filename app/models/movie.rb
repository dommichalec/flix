class Movie < ApplicationRecord

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

  # class methods

  # selects movies that've already been released and orders them
  # in descending release date (stating with most recently released)
  def self.released
    where("released_on <= ?", Time.now).order("released_on desc")
  end

  # instance methods

  # defines whether or not a movie is a flop
  def flop?
    self.total_gross <= 50000000
  end
end
