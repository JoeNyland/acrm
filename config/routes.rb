Rails.application.routes.draw do

  # ToDo: Root path
  root 'clients#index'

  # Sessions
  get    '/login'   => 'sessions#new'
  post   '/login'   => 'sessions#create'
  delete '/logout'  => 'sessions#destroy'

  # Clients
  resources :clients

end
