Rails.application.routes.draw do
  root to: "homes#top"
  get  'home/about', to: 'homes#about', as: 'about'
  devise_for :users

  resources :books, only: [:show, :index, :edit, :create, :update, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :index, :edit, :update]
end
