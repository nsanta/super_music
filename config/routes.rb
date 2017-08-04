Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :artists, only: [:index, :create, :show, :update, :destroy] do
        resources :albums , only: [:index]
      end
      resources :albums , only: [:index, :create, :show, :update, :destroy]
    end
  end
end
