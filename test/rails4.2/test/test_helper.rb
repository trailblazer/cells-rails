ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# MiniTest::Spec.class_eval do
#   after :each do
#     # DatabaseCleaner.clean
#     Thing.delete_all
#     Comment.delete_all
#     User.delete_all
#   end
# end

Rails.backtrace_cleaner.remove_silencers! # YES, stacktraces are awesome!
