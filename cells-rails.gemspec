# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cells/rails/version'

Gem::Specification.new do |spec|
  spec.name = 'cells-rails'
  spec.version = Cells::Rails::VERSION
  spec.authors = ['Nick Sutterer']
  spec.email = ['apotonick@gmail.com']
  spec.license = 'MIT'

  spec.summary = 'Convenient Rails support for Cells.'
  spec.homepage = 'https://trailblazer.to'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/trailblazer/cells-rails'
  spec.metadata['bug_tracker_uri'] = "#{spec.metadata['source_code_uri']}/issues"
  spec.metadata['changelog_uri'] = "#{spec.metadata['source_code_uri']}/blob/HEAD/CHANGES.md"
  spec.metadata['documentation_uri'] = 'https://trailblazer.to/2.1/docs/cells#cells-rails'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|\.github)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'actionpack', '>= 5.0'
  spec.add_dependency 'cells', '>= 4.1.6', '< 5.0.0'

  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'cells-erb'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'sass-rails'
end
