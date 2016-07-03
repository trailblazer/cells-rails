module Cell
  module RailsExtensions
    # This modules overrides Cell::Testing#controller_for and provides Rails-specific logic.
    module Testing
      def controller_for(controller_class)
        return unless controller_class

        controller_class.new.tap do |ctl|
          ctl.request = action_controller_test_request
          ctl.instance_variable_set :@routes, ::Rails.application.routes.url_helpers
        end
      end

      def action_controller_test_request
        if ::Rails.version.start_with?('5')
          ::ActionController::TestRequest.create
        else
          ::ActionController::TestRequest.new
        end
      end
    end # Testing
  end
end

Cell::Testing.send(:include, Cell::RailsExtensions::Testing)
