module Cell
  module RailsExtension
    module Collection
      def call(*)
        super.html_safe
      end

      def html_safe?
        true
      end
    end
  end
end
