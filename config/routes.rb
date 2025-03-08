Rails.application.routes.draw do
  root to: "homes#top"
  get  'homes/about', to: 'homes#about', as: 'about'
  devise_for :users

  resources :books, only: [:show, :index, :edit, :create, :update, :destroy]
  
  resources :users, only: [:show, :index, :edit, :update]
end
