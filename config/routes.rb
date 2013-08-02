Hymnal::Application.routes.draw do
  root 'featured_songs#index'

  resources :songs, only: [:index, :show]

  namespace :admin do
    get "/" => "songs#index"
    resources :songs
    resources :song_sections
  end
end
