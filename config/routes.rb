Rails.application.routes.draw do
  devise_for :users
  root "books#top"
  get '/home/about', to: 'books#about'
  resources :books, only: [:index, :create, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
