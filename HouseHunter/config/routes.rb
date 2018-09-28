Rails.application.routes.draw do
  resources :houses
  get 'home/index'
  resources :companies
  resources :roles
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
