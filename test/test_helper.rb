ENV['RAILS_ENV'] = 'test'

require 'minitest/autorun'

require 'cells-rails'
require "cells-erb"
require 'rails'
require 'debug'

require_relative "dummy/config/environment"

require "rails/test_help" # adds stuff like @routes, etc.
