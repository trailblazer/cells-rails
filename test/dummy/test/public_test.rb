require "test_helper"

class PublicTest < Minitest::Spec
  # ::rails_version
  it { _(Cell.rails_version).must_equal Gem::Version.new(ActionPack::VERSION::STRING) }

  # ViewModel.cell(collection: []) renders html_safe.
  it { _(Cell::ViewModel.cell("song", collection: [Object]).().class).must_equal ActiveSupport::SafeBuffer }

  # #call returns html_safe.
  it { _(SongCell.new(nil).()).must_be_instance_of ActiveSupport::SafeBuffer }
end
