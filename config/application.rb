require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Flix
  class Application < Rails::Application
    # makes sure that we always have a database connection established when
    # we're in the Rails console
    console do
      ActiveRecord::Base.connection
    end
  end
end
