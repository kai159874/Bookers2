Rails.application.routes.draw do
  root to: "homes#top"
  get 'homes/about'

  devise_for :users
  resources :users, only: [:index, :show, :edit]
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'

  resources :books
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
