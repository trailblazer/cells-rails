class AssetHelperTest < ActionController::TestCase
  tests SongsController

  it do
    get :with, song: { method: :image_tag, args: "logo.png" }
    response.body.must_equal "<img src=\"http://assets.com/images/logo.png\" alt=\"Logo\" />"
  end

  it do
    get :with, song: { method: :asset_path, args: "logo.png" }
    response.body.must_equal "http://assets.com/logo.png"
  end

  it do
    get :with, song: { method: :javascript_include_tag, args: "application" }
    response.body.must_equal "<script src=\"http://assets.com/javascripts/application.js\"></script>"
  end

  it do
    get :with, song: { method: :stylesheet_link_tag, args: "application" }
    response.body.must_equal "<link rel=\"stylesheet\" media=\"screen\" href=\"http://assets.com/assets/application-ae67369b0d44c9d224935616d0aac254eb2b4038625a8b7f0e72256bd24dc274.css\" />"
  end

  it do
    get :with, song: { method: :asset_url, args: "application.css" }
    response.body.must_equal "http://assets.com/assets/application-ae67369b0d44c9d224935616d0aac254eb2b4038625a8b7f0e72256bd24dc274.css"
  end
end
