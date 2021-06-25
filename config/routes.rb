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

  namespace :member do
    resources :orders, only: [:new, :create, :index, :show] do
      get :confirm, on: :collection
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
    resources :cart_items,only:[:create, :show,:destroy]
    end

    get '/' => 'member/products#top'
    get '/about'  => 'member/products#about'

  namespace :admin do
    resources :genres
    resources :products,only: [:new,:create,:index,:show,:edit,]
    resources :members,only: [:index,:show,:edit,:update] do
        collection do
         get 'quit'
         patch 'out'
      end
    end
    patch 'products/:id' => 'products#update'
    patch 'genres/:id/update' => 'genres#update'
  end
end