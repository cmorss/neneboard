
USE_JASMINE_RAKE=true

  # Load the rails application
require File.expand_path('../application', __FILE__)

require File.expand_path('../../lib/extensions', __FILE__)

# Initialize the rails application
Neneboard::Application.initialize!
