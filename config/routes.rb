Rails.application.routes.draw do
  root to: "venues#index"
  
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
  

  # only create an event associated with a venue
  resources :venues, only: [:index] do
    resources :events, only: [:index, :show, :create, :new, :edit, :destroy]
  end

end


# what's next?
# what routes do i need for events
# create a nested new/create action for venues/events

# we need to have the ability to edit/delete events 

# create venues in seeds files so users can add events to these venues

# create a venues index page, shows all venues as clickable 

# when clicked this will take them to venues page where user can select to add a new event to that venue

# scope method => order all venues in alphabetical order, or a search form 

# add hidden fields to venues/events/new forms
# for venues/events/new form, create a drop down for user to select from existing venues 

# need to create custom attribute writer
