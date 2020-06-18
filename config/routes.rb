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

      post '/channel_movies', to: 'channel_movies#create'
      delete '/channel_movies', to: 'channel_movies#delete'
    end
  end
end
