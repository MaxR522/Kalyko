Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
   devise_scope :user do
     authenticated :user do
      root to: "recipes#index", as: :authenticated_root
     end
     unauthenticated do
      root :to => "devise/sessions#new", as: :unauthenticated_root
     end
    end

  resources :users, only: [:show, :index]
  
  resources :recipes

  root to: "recipes#index"

  # get '/tagged', to: "recipes#tagged", as: :tagged
end
