Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/users/persist_login', to: 'users#persist_login'
      post '/users/login', to: 'users#login'
      post '/users', to: 'users#create'
      patch '/users', to: 'users#update'
      delete '/users', to: 'users#destroy'
      
      post '/movies', to: 'movies#create'
      patch '/movies', to: 'movies#update'
      delete '/movies/:id', to: 'movies#delete'

      post '/channelmovies', to: 'channelmovies#create'
      delete '/channelmovies/:channel_id/:movie_id', to: 'channelmovies#delete'
    end
  end
end
