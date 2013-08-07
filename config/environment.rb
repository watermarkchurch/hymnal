# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load application configuration code
require "hymnal/config"
require_relative "hymnal"

# Initialize the Rails application.
Hymnal::Application.initialize!
