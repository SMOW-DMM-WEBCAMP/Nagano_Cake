Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

 devise_for :members, skip: :all
  devise_scope :member do
    get 'members/sign_in' => 'member/sessions#new', as: 'new_member_session'
    post 'members/sign_in' => 'member/sessions#create', as: 'member_session'
    get 'members/sign_out' => 'member/sessions#destroy', as: 'destroy_member_session'
    get 'members/sign_up' => 'member/registrations#new', as: 'new_member_registration'
    post 'members' => 'member/registrations#create', as: 'member_registration'
    get 'members/password/new' => 'member/passwords#new', as: 'new_member_password'
  end

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
    end
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