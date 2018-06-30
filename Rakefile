ENGINE_ROOT = File.expand_path('test/dummy', __dir__)
APP_RAKEFILE = File.expand_path('test/dummy/Rakefile', __dir__)
load 'rails/tasks/engine.rake'

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.pattern = 'test/**/*_test.rb'
end

require "bundler/gem_tasks"
require "rake/testtask"

task :default => :test
