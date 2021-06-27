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

  get '/' => 'member/products#top'
  get 'order/confirm' => 'homes#top'
  get '/about'  => 'member/products#about'

  namespace :member do
    resources :members, only: [:show, :edit, :update]
    get 'confirm/:id' => 'members#confirm', as: 'confirm_confirm'
    patch 'withdraw/:id' => 'members#withdraw', as: 'withdraw_member'
    resources :orders, only: [:new, :create, :index, :show] do
      post :confirm, on: :collection
      get :thanks, on: :collection
      post 'orders/new' => 'orders#new'
    end
    resources :cart_items 
    resources :shipping_addresses, only: [:index, :create, :update, :destroy, :edit]
    resources :products,only:[:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
     collection do
      delete 'all_destroy'
     end
    end

  end

  namespace :admin do
    resources :members,only: [:index,:show,:edit,:update] do
      get :search, on: :collection
    end
    resources :genres
    resources :products,only: [:new,:create,:index,:show,:edit,]
    resources :orders,only: [:index,:show,:update]
    resources :ordered_products,only: [:update]
    patch 'products/:id' => 'products#update'
    patch 'genres/:id/update' => 'genres#update'
    post 'genres/:id/edit' => 'genres#edit'
  end
end