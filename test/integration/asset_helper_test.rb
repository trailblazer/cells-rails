class AssetHelperTest < ActionController::TestCase
  tests SongsController

  it do
    get :with, params: { song: { method: :image_tag, args: "logo.jpg" } }
    response.body.must_equal "<img src=\"http://assets.com/assets/logo.jpg\" />"
  end

  it do
    get :with, params: { song: { method: :asset_path, args: "logo.jpg" } }
    response.body.must_equal "http://assets.com/assets/logo.jpg"
  end

  it do
    get :with, params: { song: { method: :stylesheet_link_tag, args: "application" } }
    response.body.must_equal "<link rel=\"stylesheet\" media=\"screen\" href=\"http://assets.com/assets/application.css\" />"
  end

  it do
    get :with, params: { song: { method: :asset_url, args: "application.css" } }
    response.body.must_equal "http://assets.com/assets/application.css"
  end
end
