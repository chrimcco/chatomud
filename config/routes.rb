Rails.application.routes.draw do

  #resources :players, only: [:show, :create, :destroy], defaults: { format: :json }
  get '/players', to: 'players#show', defaults: { format: :json }
  post '/players', to: 'players#create', defaults: { format: :json }
  post '/players/authenticate', defaults: { format: :json }

  get '/characters/yours', defaults: { format: :json }
  post '/characters', to: 'characters#create', defaults: { format: :json }

  resources :rooms, only: [:index, :create], defaults: { format: :json }
  
  resources :items, only: [:index, :create, :update, :destroy], defaults: { format: :json }

end
