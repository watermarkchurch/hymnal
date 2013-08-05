Hymnal::Application.routes.draw do
  devise_for :users, only: [:sessions, :password]

  root 'featured_songs#index'
  resources :songs, only: [:index, :show]

  namespace :admin do
    root to: "songs#index"
    resources :songs
    resources :song_sections
  end
end
