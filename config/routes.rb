Rails.application.routes.draw do
  root 'welcome#index'
  get '/register', to: 'users#new'
  get '/dashboard', to: 'dashboard#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show, :create] do
        post "/ships", to: "games/ships#create"
        post "/shots", to: "games/shots#create"
      end

      resources :users, only: [:index, :show, :update]
    end
  end

  resources :users, only: [:show, :index, :edit, :update, :create]
  resources :account_activations, only: [:edit]
end
