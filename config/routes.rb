# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  # Posts
  resources :posts do
    resources :comments, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
    get 'favorites/favorite_status', on: :member, to: 'favorites#favorite_status'
  end

  # Users
  resources :users do
    member do
      get :following, :followers, :liked_posts
    end
    resource :relationships, only: %i[create destroy]
  end

  # Profiles
  resource :profile, only: %i[show edit update]

  # Sign Up Steps
  resources :signup, only: [] do
    collection do
      get 'step1'
      get 'step2'
    end
  end

  # Password Resets
  resources :password_resets, only: %i[new create edit update]


  # Photos
  scope :photos do
    get 'capture', to: 'photos#capture'
    post 'create', to: 'photos#create'
    get 'detect_faces', to: 'photos#detect_faces'
  end

  # User Sessions
  get 'login', to: 'user_sessions#new' 
  post 'login', to: 'user_sessions#create' 
  delete 'logout', to: 'user_sessions#destroy'
  post 'guest_login', to: 'user_sessions#guest_login'

  # Static Pages
  get 'pages/policy', to: 'pages#policy'
  get 'pages/about', to: 'pages#about'

  # Development Tools
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
