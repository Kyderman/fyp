Rails.application.routes.draw do
  resources :friendships
  resources :scores
  resources :fixtures
  resources :cups
  resources :leagues
  resources :competitions
  resources :teams
  resources :sports
  resources :organisations
  root to: 'visitors#index'
  devise_for :users

  resources :users
end
