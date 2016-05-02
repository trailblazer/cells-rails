$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'cells/rails'

require 'minitest/autorun'

ENV['RAILS_ENV'] = 'test'
require_relative 'dummy/config/environment'

require "rails/test_help" # adds stuff like @routes, etc.

require 'cells'
require "cells-erb"

