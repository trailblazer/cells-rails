require 'test_helper'

class ViewExtensionsTest < ActionController::TestCase
  tests MusicianController

  class Cell < Cell::Concept
    def show
      "<b>#{model}</b>"
    end
  end

  class SongCell < ::Cell::ViewModel
    def show
      "<b>#{model}</b>"
    end
  end


  # #concept is available in controller views.
  test "concept(..).show" do
    get :view_with_concept_with_show
    assert_equal "&lt;b&gt;Up For Breakfast&lt;/b&gt;", @response.body # TODO: test options/with twin.
  end

  test "concept(..).call" do
    get :view_with_concept_with_call
    assert_equal "<b>A Tale That Wasn't Right</b>", @response.body # TODO: test options/with twin.
  end

  test "concept(..) without #call" do
    get :view_with_concept_without_call
    assert_equal "<b>A Tale That Wasn't Right</b>", @response.body
  end

  test "cell(collection: ..) without #call" do
    get :view_with_collection_without_call
    assert_equal "<b>A Tale That Wasn't Right</b>", @response.body
  end

  test "cell(..) with #call" do
    get :view_with_cell_with_call
    assert_equal "<b>A Tale That Wasn't Right</b>", @response.body
  end

  # Controller#concept
  test "Controller#concept(..).call" do
    get :action_with_concept_with_call
    assert_equal "<b>A Tale That Wasn't Right</b>", @response.body # TODO: test options/with twin.
  end

  # Controller#cell
  test "Controller#cell(..).call" do
    get :action_with_cell_with_call
    assert_equal "<b>A Tale That Wasn't Right</b>", @response.body # TODO: test options/with twin.
  end
end
