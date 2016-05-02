require "cells/rails/version"
require "cells"

require "cell/rails/collection"
require "cell/rails/constant_for"

Cell::Collection.send :include, Cell::RailsExtension::Collection
Cell::ViewModel.send :include, Cell::RailsExtension::ConstantFor

require "cell/caching/notification"
require "cell/railtie"

module Cell
  autoload :TestCase, "cell/test_case"
end
