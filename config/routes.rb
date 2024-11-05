Rails.application.routes.draw do
  root 'misc#homepage'

  get '/directors/youngest', to: 'directors#max_dob'
  get '/directors/eldest', to: 'directors#min_dob'
  get '/directors', to: 'directors#index', as: 'directors'
  get '/directors/new', to: 'directors#new', as: 'new_director'
  post '/directors', to: 'directors#create'
  get '/directors/:id/edit', to: 'directors#edit', as: 'edit_director'
  get '/directors/:id', to: 'directors#show', as: 'director'
  patch '/directors/:id', to: 'directors#update'
  delete '/directors/:id', to: 'directors#destroy'

  # Routes for movies
  get '/movies', to: 'movies#index'
  get '/movies/new', to: 'movies#new'
  post '/movies', to: 'movies#create'
  get '/movies/:id', to: 'movies#show', as: 'movie'
  get '/movies/:id/edit', to: 'movies#edit', as: 'edit_movie'
  patch '/movies/:id', to: 'movies#update'
  delete '/movies/:id', to: 'movies#destroy'

  # Routes for actors
  get '/actors', to: 'actors#index'
  get '/actors/new', to: 'actors#new', as: 'new_actor'
  post '/actors', to: 'actors#create'
  get '/actors/:id', to: 'actors#show', as: 'actor'
  get '/actors/:id/edit', to: 'actors#edit', as: 'edit_actor'
  patch '/actors/:id', to: 'actors#update'
  delete '/actors/:id', to: 'actors#destroy'
end
