module Cell
  module RailsExtensions
    # This modules overrides Cell::Testing#controller_for and provides Rails-specific logic.
    module Testing
      RAILS_7_0 = Gem::Version.new("7.0.0")
      RAILS_5_1 = Gem::Version.new("5.1.0")
      RAILS_5_0 = Gem::Version.new("5.0.0")

      def controller_for(controller_class)
        return unless controller_class

        controller_class.new.tap do |ctl|
          ctl.request = action_controller_test_request(controller_class)
          ctl.instance_variable_set :@routes, ::Rails.application.routes.url_helpers
        end
      end

      def action_controller_test_request(controller_class)
        version = ::Rails.gem_version

        if version >= RAILS_5_1 && version < RAILS_7_0
          ::ActionController::TestRequest.create(controller_class)
        elsif version >= RAILS_5_0 && version < RAILS_5_1
          ::ActionController::TestRequest.create
        else
          ::ActionController::TestRequest.new
        end
      end
    end # Testing
  end
end

Cell::Testing.send(:include, Cell::RailsExtensions::Testing)
