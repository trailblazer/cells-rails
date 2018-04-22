$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'minitest/autorun'

require 'cells-rails'
require "cells-erb"

TEST_RAILS_VERSION = ENV['RAILS_VERSION'] || '5.0'
ENV['RAILS_ENV'] = 'test'
require_relative "rails#{TEST_RAILS_VERSION}/config/environment"

require "rails/test_help" # adds stuff like @routes, etc.
