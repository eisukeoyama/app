Rails.application.routes.draw do
  
  devise_for :users
  get 'books/life' => 'books#life'
  get 'books/self' => 'books#self'
  get 'books/work' => 'books#work'
  get 'books/psychology' => 'books#psychology'
  get 'books/thought' => 'books#thought'
  get 'books/business' => 'books#business'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end 

  resources :users, only: [:show]
  
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]

  root 'books#index'
  end