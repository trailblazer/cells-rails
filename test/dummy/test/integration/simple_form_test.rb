require "test_helper"

class SimpleFormTest < Minitest::Spec
  include Cell::Testing
  controller SongsController # provides #url_options.

  it do
    if Rails.version >= "6.0"
      _(cell("simple_form").().gsub(/\s\s/, "")).must_equal %{<form class=\"simple_form edit_song\" id=\"edit_song_1\" action=\"/songs/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" autocomplete=\"off\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" autocomplete=\"off\" /> First <div class=\"input string required song_id field_without_errors\"><label class=\"string required\" for=\"song_id\"><abbr title=\"required\">*</abbr> Id</label><input class=\"string required\" required=\"required\" aria-required=\"true\" type=\"text\" value=\"1\" name=\"song[id]\" id=\"song_id\" /></div><div class=\"input string required song_artist_id\"><label class=\"string required\" for=\"song_artist_id\"><abbr title=\"required\">*</abbr> Id</label><input class=\"string required\" required=\"required\" aria-required=\"true\" type=\"text\" name=\"song[artist][id]\" id=\"song_artist_id\" /></div></form>}
    else
      _(cell("simple_form").().gsub(/\s\s/, "")).must_equal("<form class=\"simple_form edit_song\" id=\"edit_song_1\" action=\"/songs/1\" accept-charset=\"UTF-8\" method=\"post\"><input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" /><input type=\"hidden\" name=\"_method\" value=\"patch\" /> First <div class=\"input string required song_id field_without_errors\"><label class=\"string required\" for=\"song_id\"><abbr title=\"required\">*</abbr> Id</label><input class=\"string required\" required=\"required\" aria-required=\"true\" type=\"text\" value=\"1\" name=\"song[id]\" id=\"song_id\" /></div><div class=\"input string required song_artist_id\"><label class=\"string required\" for=\"song_artist_id\"><abbr title=\"required\">*</abbr> Id</label><input class=\"string required\" required=\"required\" aria-required=\"true\" type=\"text\" name=\"song[artist][id]\" id=\"song_artist_id\" /></div></form>")
    end
  end
end
