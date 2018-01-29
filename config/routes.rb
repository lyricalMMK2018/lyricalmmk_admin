Rails.application.routes.draw do
  devise_for :admins
  root to: 'admins#top'
  resources :users, except: [:create, :new]
  resources :items, except: :show
  resources :disks, only: [:create, :update, :destroy]
  resources :songs, only: [:create, :update, :destroy]
  resources :artists, only: [:index, :create, :update, :destroy]
  resources :genres, only: [:index, :create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
