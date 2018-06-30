module Cell
  module Caching
    module Notifications
      def fetch_from_cache_for(key, options)
        ActiveSupport::Notifications.instrument("cells.read_fragment", key: key) do
          cache_store.fetch(key, options) do
            ActiveSupport::Notifications.instrument("cells.write_fragment", key: key) do
              yield
            end
          end
        end
      end
    end
  end
end
