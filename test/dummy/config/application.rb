require File.expand_path('../boot', __FILE__)

require "rails"
require "active_model/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EngineCells
  class Application < Rails::Application
    config.eager_load = false

    # enable asset pipeline as in development/test.
    config.assets.enabled = true
    config.assets.compile = true
    config.assets.digest = false

    config.cells.with_assets = ["user/cell", "song_cell"]
  end
end

Rails.application.config.root = Rails.root.join('test', 'dummy')
