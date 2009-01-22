# load the main spec helper
require File.expand_path(File.dirname(__FILE__) + "/../../../../spec/spec_helper")

# install the schema
load(File.dirname(__FILE__) + "/schema.rb") if File.exist?(File.dirname(__FILE__) + "/schema.rb")

# load the models used in the specs
require File.dirname(__FILE__) + "/spec_models.rb"

# make it so we can use 'logger' instead of the long winded RAILS_DEFAULT_LOGGER
def logger
  RAILS_DEFAULT_LOGGER
end
