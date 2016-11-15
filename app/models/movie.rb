class Movie < ApplicationRecord

  def self.released
    where("released_on <= ?", Time.now).order("released_on desc")
  end

  def flop?
    self.total_gross <= 50000000
  end
end
