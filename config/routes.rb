Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    resources :order_details, only: [:update]
    # patch 'order_details/:id', to: 'order_details#update'

    resources :orders, only: [:show, :update]
    # get 'orders/:id', to: 'orders#show'
    # patch 'orders/:id', to: 'orders#update'

    resources :customers, only: [:index, :show, :edit, :update]
    # get 'customers', to: 'customers#index'
    # get 'customers/:id', to: 'customers#show'
    # get 'customers/:id/edit', to: 'customers#edit'
    # patch 'customers/:id', to: 'customers#update'

    resources :genres, only: [:index, :create, :edit, :update]
    # get 'genres', to: 'genres#index'
    # post 'genres', to: 'genres#create'
    # get 'genres/:id/edit', to: 'genres#edit'
    # patch 'genres/:id', to: 'genres#update'

    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    # get 'items', to: 'items#index'
    # get 'items/new'
    # post 'items', to: 'items#create',as: "items"
    # get 'items/:id', to: 'items#show'
    # get 'items/:id/edit', to: 'items#edit'
    # patch 'items/:id', to: 'items#update'

    root to: 'homes#top'
  end

  scope module: :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    # get 'addresses', to: 'address#index'
    # get 'addresses/:id/edit', to: 'address#edit'
    # post 'addresses', to: 'address#create'
    # get 'addresses/:id', to: 'address#update'
    # get 'addresses/:id', to: 'address#destroy'

    resources :orders, only: [:new, :create, :index, :show]
    # get 'orders/new'
    post 'orders/confirm'
    get 'orders/complete'
    # post 'orders', to: 'cart_items#create'
    # get 'orders', to: 'cart_items#index'
    # get 'orders/:id', to: 'cart_items#show'

    delete 'cart_items/destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    # get 'cart_items', to: 'cart_items#index'
    # patch 'cart_items/:id', to: 'cart_items#update'
    # delete 'cart_items/:id', to: 'cart_items#destroy'

    # post 'cart_items', to: 'cart_items#create'

    get 'customers/my_page', to: 'customers#show'
    get 'customers/information/edit', to: 'customers#edit'
    patch 'customers/information', to: 'customers#update'
    get 'customers/unsubscribe', to: 'customers#unsubscribe'
    patch 'customers/withdraw', to: 'customers#withdraw'

    resources :items, only: [:index, :show]
    # get 'items', to: 'items#index'
    # get 'items/:id', to: 'items#show'

    root to: 'homes#top'
    get 'about', to: 'homes#about'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
