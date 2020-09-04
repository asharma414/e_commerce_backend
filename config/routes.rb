Rails.application.routes.draw do
  post '/checkout', to: 'orders#checkout'
  post '/login', to: 'users#login' 
  get '/cart', to: 'orders#cart'
  get '/stats', to: 'stats#index'
  get '/users/:id/orders', to: "users#show"
  resources :artifacts
  resources :orders
  resources :users, :except => [:show]
  resources :categories

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
