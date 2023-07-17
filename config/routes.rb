Rails.application.routes.draw do
  
  root to: 'homes#top'
  devise_for :users
  
  resources :books, only: [:new, :index, :show, :create, :detroy]
  resources :users, only: [:show, :edit, :update, :index]
  get 'homes/about' => 'homes#about', as: 'about'
  get 'books' => 'books#new'
  get 'books' => 'books#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
