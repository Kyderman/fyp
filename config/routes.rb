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
end
