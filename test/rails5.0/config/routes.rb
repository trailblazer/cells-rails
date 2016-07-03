Rails.application.routes.draw do
  get ':controller(/:action(/:id(.:format)))'

  mount MyEngine::Engine => "/"
  root to: "index#index"

  resources :songs
  resources :musicians

  get "songs/with_image_tag"
  get "songs/with_escaped"
end
