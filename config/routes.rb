Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :artists, only: [:index, :create, :show, :update, :destroy] do
        resources :albums , only: [:index]
        resources :songs, only: [:index]
      end
      resources :albums , only: [:index, :create, :show, :update, :destroy] do
        resources :songs, only: [:index]
      end
      resources :songs, only: [:index, :create, :show, :update, :destroy]
      resources :playlists, only: [:index, :create, :show, :update, :destroy] do
        resource :song, only: [:create, :destroy], controller: 'playlists/songs'
      end
    end
  end
end
