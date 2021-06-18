Rails.application.routes.draw do
  devise_for :admins
  devise_for :members

  namespace :member do
    resources :orders, only: [:new, :create, :index, :show] do
      get :confirm, on: :collection
      get :thanks, on: :collection
    end
  end

end
