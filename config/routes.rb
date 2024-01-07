Rails.application.routes.draw do
  
  root to: 'homes#top'
  devise_for :users
  get 'homes/about'
  get 'books'=> 'books#index'
  get 'users'=> 'users#index'
  
  resources :books, only: [:new, :index, :show, :index, :create, :update]
  resources :users, only: [:show, :edit, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
