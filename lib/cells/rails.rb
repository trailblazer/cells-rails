require "cells"
require "cell/railtie"
require "cell/caching/notification"
require "cell/rails/testing"

module Cell
  autoload :Translation, "cell/translation"
  autoload :TestCase, "cell/test_case"
end
