require 'test_helper'

class MusiciansController < ApplicationController
end

class WithDefaultOptionsController < ApplicationController
  private
  def default_url_options(options={})
    options.merge(anchor: 'foobar')
  end
end

class UrlCell < Cell::ViewModel
  def show
    url_for(model)
  end
end

class UrlHelperTest < Minitest::Spec
  include Cell::Testing
  controller MusiciansController

  let (:song_cell) { UrlCell.new(Song.new, context: { controller: controller }) }

  # path helpers work in cell instance.
  it { _(song_cell.songs_path).must_equal "/songs" }
  it { _(song_cell.()).must_equal "http://test.host/songs/1" }
end


class UrlTest < ActionDispatch::IntegrationTest
  include ::Capybara::DSL

  it do
    visit "/songs/new" # cell.url_for(Song.new)
    _(page.text).must_equal "http://www.example.com/songs/1"
  end

  # it do
  #   visit "/songs/1/edit"
  #   page.text.must_equal "http://www.example.com/songs/1"
  # end
end

class DefaultOptionsTest < Minitest::Spec
  include Cell::Testing
  controller WithDefaultOptionsController

  let (:song_cell) { UrlCell.new(Song.new, context: { controller: controller }) }

  it { _(song_cell.songs_path).must_equal "/songs#foobar" }
end
