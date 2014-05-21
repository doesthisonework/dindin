Rails.application.routes.draw do
  root to: 'recipes#index'

  resources :recipes
  resources :ingredients
  
  devise_for :users

  get 'static_pages/about'
end
