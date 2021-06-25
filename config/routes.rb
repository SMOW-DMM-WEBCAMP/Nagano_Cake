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

  scope module: :public do
    resource :customers,only: [:edit,:update,:show] do
        collection do
         get 'quit'
         patch 'out'
      end
    end
  end

  namespace :member do
    resources :orders, only: [:new, :create, :index, :show] do
      post :confirm, on: :collection
      get :thanks, on: :collection
    end
    resources :shipping_addresses # yuki add [shipping_address]
    post 'shipping_address/create' => 'shipping_addresses#create'
    patch 'shipping_addresses/:id/update' => 'shipping_addresses#update'
    resources :products,only:[:index, :show]
    resources :cart_items,only:[:create, :show,:destroy]
  end

    get '/' => 'member/products#top'
    get '/about'  => 'member/products#about'

  namespace :admin do
    resources :genres
    resources :products,only: [:new,:create,:index,:show,:edit,]
    resources :orders,only: [:index,:show,:update]
    resources :ordered_products,only: [:update]
    resources :members,only:[:index,:show,:edit,:update]
    patch 'products/:id' => 'products#update'
    patch 'genres/:id/update' => 'genres#update'
  end
end
