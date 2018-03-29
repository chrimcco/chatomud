Rails.application.routes.draw do

  resources :rooms, only: [:index], defaults: { format: :json }
  resources :items, only: [:index, :create, :update, :destroy], defaults: { format: :json }

end
