Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/users/persist_login', to: 'users#persist_login'
      post '/users/login', to: 'users#login'
      get '/users/:id', to: 'users#show'
      post '/users', to: 'users#create'
      patch '/users', to: 'users#update'
      delete '/users', to: 'users#destroy'
      
      get '/movies', to: 'movies#index'
      get '/movies/:id', to: 'movies#show'
      post '/movies', to: 'movies#create'
      delete '/movies/:id', to: 'movies#delete'
    end
  end
end
