Rails.application.routes.draw do



  resources :house_interest_lists
  resources :user_company_mappings
  resources :inquiries
  # get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/all_inquiries', to: 'inquiry_replies#index'
  resources :companies
  resources :users
  resources :houses
  resources :inquiry_replies
  #resources :sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
end

