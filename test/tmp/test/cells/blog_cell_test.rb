require 'test_helper'

class BlogCellTest < Cell::TestCase
  test "show" do
    html = cell("blog").(:show)
    assert html.match /<p>/
  end

  test "post" do
    html = cell("blog").(:post)
    assert html.match /<p>/
  end

  test "latest" do
    html = cell("blog").(:latest)
    assert html.match /<p>/
  end


end
