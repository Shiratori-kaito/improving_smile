Rails.application.routes.draw do
  get 'post/index'
  get 'post/new'
  get 'post/edit'
  root to: 'home#index'
  resources :posts
  resources :users do
    resources :followings, only: [:index], module: :users
    resources :followers, only: [:index], module: :users
  end
  resource :profile, only: [:show, :edit, :update]
  get 'presigned_url', to: 'uploads#presigned_url'
  get 'photos/capture'
  post 'photos/create'
  #localhost:3000/photos/detect_facesにアクセスしたら、photosコントローラーのdetect_facesアクションを呼び出す
  get 'photos/detect_faces', to: 'photos#detect_faces'
  get 'login', to: 'user_sessions#new' #login_pathが使えるようになり、login_pathが使われるとログイン画面（'user_sessions#new'）に移動する
  post 'login', to: 'user_sessions#create' #login_path('user_sessions#new')からのデータを'user_sessions#create'へ受け取って、データベースに保存
  delete 'logout', to: 'user_sessions#destroy'
end
