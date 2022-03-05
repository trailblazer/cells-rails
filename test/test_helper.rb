ENV['RAILS_ENV'] = 'test'

require 'minitest/autorun'

require 'cells-rails'
require "cells-erb"
require 'rails'
rails_version  =  Rails.version[0..2]

require_relative "rails#{rails_version}/config/environment"

require "rails/test_help" # adds stuff like @routes, etc.
