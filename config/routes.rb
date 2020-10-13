Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  resources :recipes

  root to: "recipes#index"

  # get '/tagged', to: "recipes#tagged", as: :tagged
end
