Rails.application.routes.draw do
  devise_for :admins
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :member do
    resources :orders, only: [:new, :create, :index, :show] do
      get :confirm, on: :collection
      get :thanks, on: :collection
    end
  end

  namespace :admin do
    resources :genres
    resources :products,only: [:new,:create,:index,:show]
    patch 'genres/:id/update' => 'genres#update'
  end

end
