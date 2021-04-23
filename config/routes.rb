Rails.application.routes.draw do
  root "events#index"
  
  get '/login', to: "sessions#login"

  resources :sessions

  resources :events, only: [:index]

  resources :venues, only: [:index]

  resources :users, only: [:show, :new, :create, :edit, :update]

  resources :venues do
    resources :events, only: [:index, :show]
  end

  resources :users do
    resources :events, only: [:index, :new, :create, :edit, :update]
  end

  resource :users do
    resources :venues, only: [:index, :new, :create, :edit, :update]
  end
end
