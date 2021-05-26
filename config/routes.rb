Rails.application.routes.draw do
  # root to login page and add button there to 'sign up'
  root 'sessions#new'
  
  get '/profile', to: 'users#profile'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#omniauth' 
  get 'auth/failure', to: redirect('/')
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'
  get '/alphabetical_venues', to: 'alphabetical_venues#index'

  resources :users

  resources :events, only: [:index, :show, :create, :new, :edit, :destroy]

  # only create an event associated with a venue
  resources :venues do
    resources :events, only: [:index, :show, :create, :new, :edit, :destroy]
  end
  
end