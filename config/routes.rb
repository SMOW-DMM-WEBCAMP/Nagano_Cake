Rails.application.routes.draw do
  devise_for :admins
  devise_for :members
  namespace :admin do
<<<<<<< HEAD
    resources :products,only: [:new,:create,:index,:show]
=======
  resources :products,only: [:new,:create,:index]
>>>>>>> c345da9a309c3217d9bc9319bb59bd544d959f36
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
