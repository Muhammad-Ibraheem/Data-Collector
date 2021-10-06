Rails.application.routes.draw do
  root to: 'home#index'
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to:'sessions#omniauth'
end
