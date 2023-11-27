# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
  end
  get '/posts/:post_id/favorites/favorite_status', to: 'favorites#favorite_status'
  root to: 'home#index'
  resources :users do
    member do
      get :following, :followers
      get :liked_posts
    end
    resource :relationships, only: %i[create destroy]
  end
  resource :profile, only: %i[show edit update]
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
    end
  end
  get 'presigned_url', to: 'uploads#presigned_url'
  get 'photos/capture', to: 'photos#capture'
  post 'photos/create', to: 'photos#create'
  get 'photos/detect_faces', to: 'photos#detect_faces'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  post 'guest_login', to: 'user_sessions#guest_login'
  get 'pages/policy', to: 'pages#policy'
  get 'pages/about', to: 'pages#about'
  resources :password_resets, only: %i[new create edit update]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
