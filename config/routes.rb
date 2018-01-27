Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  get 'divise/admins'

  get 'devise/users'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
