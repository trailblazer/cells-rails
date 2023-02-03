class MusicianController < ActionController::Base
  def view_with_concept_with_show
    render inline: %{<%= concept("view_extensions_test/cell", "Up For Breakfast", volume: 1).show %>} # TODO: concept doesn't need .call
  end

  def view_with_concept_without_call
    render inline: %{<%= concept("view_extensions_test/cell", "A Tale That Wasn't Right") %>} # this tests ViewModel#to_s.
  end

  def view_with_concept_with_call
    render inline: %{<%= concept("view_extensions_test/cell", "A Tale That Wasn't Right").call %>}
  end

  def view_with_cell_with_call
    render inline: %{<%= cell("view_extensions_test/song", "A Tale That Wasn't Right").call %>}
  end

  def view_with_cell_with_call_keyword_args
    render inline: %{<%= cell("view_extensions_test/song", "A Tale That Wasn't Right").call(:with_title, with_title: 'test') %>}
  end

  def view_with_collection_without_call
    render inline: %{<%= cell("view_extensions_test/song", collection: ["A Tale That Wasn't Right"]) %>}
  end

  def action_with_concept_with_call
    render plain: concept("view_extensions_test/cell", "A Tale That Wasn't Right").call
  end

  def action_with_cell_with_call
    render plain: cell("view_extensions_test/song", "A Tale That Wasn't Right").call
  end
end
