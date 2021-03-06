class Registration < ApplicationRecord
  # associations
  belongs_to :movie # child to parent Movie
  belongs_to :user

  # constants
  HOW_HEARD_OPTIONS = [
    "Newspaper",
    "Twitter",
    "Facebook",
    "Search",
    "Friend/Family",
    "Other"
  ]

  # validations
  validates :how_heard, inclusion: { in: HOW_HEARD_OPTIONS }

  # use custom query scopes to dynamically define class methods
  scope :past_n_days, ->(number_of) { where('created_at >= ?' , number_of.days.ago) }

  # instance methods

  # displays full name of the registrar
  def full_name
    "#{first_name} #{last_name}"
  end

end
