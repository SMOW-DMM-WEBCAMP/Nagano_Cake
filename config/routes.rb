Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  devise_for :members, controllers: {
  sessions:      'members/sessions',
  passwords:     'members/passwords',
  registrations: 'members/registrations'
}
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :member do
    resources :orders, only: [:new, :create, :index, :show] do
      get :confirm, on: :collection
      get :thanks, on: :collection
    end
  end

  namespace :admin do
    resources :genres
    patch 'genres/:id/update' => 'genres#update'
  end

end
