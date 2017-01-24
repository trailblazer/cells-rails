require "rails/railtie"
require "cell/rails"

module Cell
  class Railtie < Rails::Railtie

    config.cells = ActiveSupport::OrderedOptions.new

    initializer("cells.attach_router") do |app|
      ViewModel.class_eval do
        include app.routes.url_helpers # TODO: i hate this, make it better in Rails.
      end
    end

    # ruthlessly stolen from the zurb-foundation gem.
    initializer "cells.update_asset_paths" do |app|
      Array(app.config.cells.with_assets).each do |cell_class|
        # puts "@@@@@ #{cell_class.camelize.constantize.prefixes}"
        app.config.assets.paths += cell_class.camelize.constantize.prefixes # Song::Cell.prefixes
      end
    end

    initializer "cells.rails_extensions" do |app|
      ActiveSupport.on_load(:action_controller) do
        self.class_eval do
          include ::Cell::RailsExtensions::ActionController
        end
      end

      ActiveSupport.on_load(:action_view) do
        self.class_eval do
          include ::Cell::RailsExtensions::ActionView
        end
      end

      require "cell/rails/collection"
      require "cell/rails/constant_for"

      Cell::Collection.send :include, Cell::RailsExtension::Collection
      Cell::ViewModel.send :include, Cell::RailsExtension::ConstantFor
    end

    initializer "cells.include_default_helpers" do
      # include asset helpers (image_path, font_path, ect)
      ViewModel.class_eval do
        include ActionView::Helpers::FormHelper # includes ActionView::Helpers::UrlHelper, ActionView::Helpers::FormTagHelper
        include ::Cell::RailsExtensions::HelpersAreShit

        require "cell/helper/asset_helper"
        include Cell::Helper::AssetHelper

        # set VM#cache_store, etc.
        include RailsExtensions::ViewModel
      end
    end

    initializer "cells.include_template_module", after: "cells.include_default_helpers" do
      # just include if exactly one template engine gem is loaded
      # otherwise we have to include it in the cells manually as needed
      engines = [:Erb, :Haml, :Hamlit, :Slim].select { |tmpl| Cell.const_defined?(tmpl, false) }
      if engines.size == 1
        ViewModel.send(:include, "Cell::#{engines.first}".constantize)
      end
    end
    #   ViewModel.template_engine = app.config.app_generators.rails.fetch(:template_engine, "erb").to_s

    initializer("cells.development") do |app|
      if Rails.env == "development"
        require "cell/development"
        ViewModel.send(:include, Development)
      end
    end

    rake_tasks do
      load "tasks/cells.rake"
    end
  end
end
