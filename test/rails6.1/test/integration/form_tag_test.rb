require "test_helper"

class FormTagTestTest < MiniTest::Spec
  include Cell::Testing
  controller SongsController

  it do
    _(cell("form_tag").().gsub(/\s\s/, "")).must_equal %{<form action=\"/songs\" accept-charset=\"UTF-8\" method=\"post\"> Second <input type=\"text\" name=\"id\" id=\"id\" /> <input type=\"submit\" name=\"commit\" value=\"Save\" data-disable-with=\"Save\" />\n</form>\n}
  end
end
