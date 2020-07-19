require "bundler/gem_tasks"
require "rake/testtask"
require 'rails'

test_folder = Rails.version[0..2]

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/rails#{test_folder}/**/*_test.rb"]
end

task :default => :test
