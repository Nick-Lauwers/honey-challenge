Rails.application.routes.draw do

  root to: 'combs#index'

  resources :combs,       only: [:index]
  resources :worker_bees, only: [:show]
  resources :advisements, only: [:update]
end
