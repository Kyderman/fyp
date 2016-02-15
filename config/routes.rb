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
  root to: 'visitors#index'
  devise_for :users

  resources :users
end
