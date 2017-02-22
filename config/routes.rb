Rails.application.routes.draw do
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :followings, :followers
    end
  end
  
  resources :microposts do
    member do
      post :retweet
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  # get 'users/:id/followings', to: 'users#followings', as: 'followings_user'
  # get 'users/:id/followers', to: 'users#followers', as: 'followers_user'
end