Rails.application.routes.draw do
  root to: "application#welcome"
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#omniauth' 
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'
  resources :users

  resources :events, only: [:index]

  resources :venues, only: [:index]

  

  resources :venues do
    resources :events, only: [:index, :show]
  end

  resources :users do
    resources :events, only: [:index, :new, :create, :edit, :update]
  end

  # resource :users do
  #   resources :venues, only: [:index, :new, :create, :edit, :update]
  # end
end
