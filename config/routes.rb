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
  get '/about'  => 'member/products#about'

  namespace :member do
    resources :orders, only: [:new, :create, :index, :show] do
      post :confirm, on: :collection
      get :thanks, on: :collection
    end
    resources :cart_items do
     collection do
      delete 'all_destroy'
     end
    end
    resources :shipping_addresses # yuki add [shipping_address]
    post 'shipping_address/create' => 'shipping_addresses#create'
    post 'shipping_addresses/:id/edit' => 'shipping_address#edit'
    patch 'shipping_addresses/:id/update' => 'shipping_addresses#update'
    resources :products,only:[:index, :show]
  end

  namespace :admin do
    resources :members,only: [:index,:show,:edit,:update] do
      collection do
        get 'quit'
        patch 'out'
      end
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

