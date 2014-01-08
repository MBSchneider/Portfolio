# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Portfolio::Application.initialize!

Time::DATE_FORMATS[:proj_time] = "%B %d, %Y at %l %p"
