Rails.application.routes.draw do
  mount MyEngine::Engine => "/"
  root to: "index#index"

  resources :songs do
    collection do
      get :with
      get :with_escaped
    end
  end

  resources :musicians do
    collection do
      get :view_with_concept_with_show
      get :view_with_concept_without_call
      get :view_with_concept_with_call
      get :view_with_cell_with_call
      get :view_with_collection_without_call
      get :action_with_concept_with_call
      get :action_with_cell_with_call
    end
  end
end
