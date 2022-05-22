# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# solo sirve para que no tome el plural en el scaffold y tambien agregar el --force-plural
# ActiveRecord::Base.pluralize_table_names = false
