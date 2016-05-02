require "test_helper"

class PublicTest < MiniTest::Spec
  # ::rails_version
  it { Cell.rails_version.must_equal Gem::Version.new(ActionPack::VERSION::STRING) }

  # ViewModel.cell(collection: []) renders html_safe.
  it { Cell::ViewModel.cell("public_test/song", collection: [Object]).().class.must_equal ActiveSupport::SafeBuffer }

  # #call returns html_safe.
  it { SongCell.new(nil).().must_be_instance_of ActiveSupport::SafeBuffer }
end
