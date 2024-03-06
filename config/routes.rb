Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :movies, only: [:index, :new, :create]
  resources :user_movies, only: [:create, :update]

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  get 'movies/add_multiple', to: 'movies#add_multiple', as: 'add_multiple_movies'
  post 'movies/create_multiple', to: 'movies#create_multiple', as: 'create_multiple_movies'


  post 'movie_scores/update_scores', to: 'user_movies#update_scores'
  get 'movie_scores/update_scores', to: 'user_movies#update_scores'

  root 'sessions#new'
end
