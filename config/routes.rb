Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users

  resources :books
  resources :users, only: [:show, :edit, :update, :index]
  get 'home/about' => 'homes#about', as: 'about'
  
  get 'books' => 'books#index'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
