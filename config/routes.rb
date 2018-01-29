Rails.application.routes.draw do
  devise_for :admins
  resources :admins, only: :show
  resources :users, except: [:create, :new]
  resources :items, except: :show
  resources :disks, only: [:create, :update, :destroy]
  resources :songs, only: [:create, :update, :destroy]
  resources :artists, only: [:index, :create, :destroy]
  resources :genres, only: [:index, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
