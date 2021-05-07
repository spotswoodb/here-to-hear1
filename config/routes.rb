Rails.application.routes.draw do
  root to: "application#welcome"
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#omniauth' 
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'


  resources :events, only: [:index]

  resources :users
  

  resources :venues, only: [:index] do
    resources :events, only: [:index, :show, :new]
  end

end
