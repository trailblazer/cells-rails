require "test_helper"

class PublicTest < MiniTest::Spec
  # ::rails_version
  it { Cell.rails_version.must_equal Gem::Version.new(ActionPack::VERSION::STRING) }

  # ViewModel.cell(collection: []) renders html_safe.
  it { Cell::ViewModel.cell("public_test/song", collection: [Object]).().class.must_equal ActiveSupport::SafeBuffer }

  # ViewModel.cell(collection: []) marks itself as html_safe?
  it { Cell::ViewModel.cell("public_test/song", collection: [Object]).must_respond_to :html_safe? }
  it { Cell::ViewModel.cell("public_test/song", collection: [Object]).html_safe?.must_equal true }

  # #call returns html_safe.
  it { SongCell.new(nil).().must_be_instance_of ActiveSupport::SafeBuffer }

  # A cell marks itself as html_safe?
  it { SongCell.new(nil).must_respond_to :html_safe? }
  it { SongCell.new(nil).html_safe?.must_equal true }
end
