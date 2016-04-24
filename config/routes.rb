Rails.application.routes.draw do
  resources :friendships
  resources :scores
  resources :fixtures
  resources :cups
  resources :leagues do

    resources :fixtures
  end
  resources :competitions do
    resources :leagues
  end
  resources :teams
  resources :sports
  resources :organisations
  resources :team_shouts
  resources :competition_shouts

  devise_for :users

  resources :users

  authenticated do
  root to: "users#show", as: :authenticated_root
  end

  root to: 'visitors#index'

get 'leagues/:id/begin', :to => 'leagues#start', as: 'league_begin'
get 'leagues/:id/league_register', :to => 'leagues#register', as: 'league_register'

get 'league_unregister/:id', :to => 'leagues#unregister', as: 'league_unregister'


end
