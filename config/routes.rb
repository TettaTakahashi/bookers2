Rails.application.routes.draw do
  
  root to: 'homes#top'
  devise_for :users
  get 'home/about', to: 'homes#about'
  get 'books'=> 'books#index'
  get 'users'=> 'users#index'
  
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  
  resources :books, only: [:new, :index, :show, :index, :create, :update, :edit, :destroy]
  resources :users, only: [:show, :edit, :index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
