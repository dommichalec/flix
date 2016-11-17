class Registration < ApplicationRecord
  # associations
  belongs_to :movie # child to parent Movie

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
  validates :first_name, :last_name, presence: true
  validates :email, format: { with: /(\S+)@(\S+)/ }
  validates :how_heard, inclusion: { in: HOW_HEARD_OPTIONS }

  # instance methods
  
  # displays full name of the registrar
  def full_name
    "#{first_name} #{last_name}"
  end

end
