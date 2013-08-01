Hymnal::Application.routes.draw do
  root 'featured_songs#index'

  namespace :admin do
    resources :songs
    resources :song_sections
  end
end
