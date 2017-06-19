Rails.application.routes.draw do
  root 'users#new'
  post 'users' => 'users#create'
  get '/dashboard/:id' => 'users#show'

  post 'sessions' => 'sessions#create'
  delete 'sessions/:id' => 'sessions#destroy'

  get 'shoes' => 'products#index'
  post 'products' => 'products#create'
  delete 'products/:id' => 'products#destroy'

  post 'purchases/:id' => 'purchases#create'
end
