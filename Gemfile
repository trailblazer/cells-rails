git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

source "https://rubygems.org"

# Specify your gem's dependencies in cells-rails.gemspec
gemspec

rails_version = ENV.fetch('RAILS_VERSION','5.2')
gem "railties", "~> #{rails_version}"
gem "activerecord", "~> #{rails_version}"
gem "sqlite3"
gem "sprockets-rails"
gem "my_engine", path: "test/dummy/engines/my_engine"

group :development, :test do
  gem "minitest-spec-rails"
  gem "capybara_minitest_spec"
end

gem "simple_form"
gem "formtastic"

case ENV["GEMS_SOURCE"]
when "local"
  gem "cells", path: "../cells"
  gem "cells-erb", path: "../cells-erb"
  gem "cells-slim", path: "../cells-slim", require: false
  gem "cells-hamlit", path: "../cells-hamlit", require: false
  gem "cells-haml", path: "../cells-haml", require: false
when "github"
  gem "cells", github: "trailblazer/cells"
  gem "cells-erb", github: "trailblazer/cells-erb"
  gem "cells-slim", github: "trailblazer/cells-slim", require: false
  gem "cells-hamlit", github: "trailblazer/cells-hamlit", require: false
  gem "cells-haml", github: "trailblazer/cells-haml", require: false
end

