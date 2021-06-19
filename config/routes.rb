Rails.application.routes.draw do
  devise_for :admins
  devise_for :members
  namespace :admin do
  resources :products,only: [:new,:create,:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
