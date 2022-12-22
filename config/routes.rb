Rails.application.routes.draw do

  namespace :admin do
    patch 'order_details/:id', to: 'order_details#update'
  end
  namespace :admin do
    get 'orders/:id', to: 'orders#show'
    patch 'orders/:id', to: 'orders#update'
  end
  namespace :admin do
    get 'customers', to: 'customers#index'
    get 'customers/:id', to: 'customers#show'
    get 'customers/:id/edit', to: 'customers#edit'
    patch 'customers/:id', to: 'customers#update'
  end
  namespace :admin do
    get 'genres', to: 'genres#index'
    post 'genres', to: 'genres#create'
    get 'genres/:id/edit', to: 'genres#edit'
    patch 'genres/:id', to: 'genres#update'
  end
  namespace :admin do
    get 'items', to: 'items#index'
    get 'items/new'
    post 'items', to: 'items#create'
    get 'items/:id', to: 'items#show'
    get 'items/:id/edit', to: 'items#edit'
    patch 'items/:id', to: 'items#update'
  end
  namespace :admin do
    root to: 'homes#top'
  end
  scope module: :public do
    get 'addresses', to: 'address#index'
    get 'addresses/:id/edit', to: 'address#edit'
    post 'addresses', to: 'address#create'
    get 'addresses/:id', to: 'address#update'
    get 'addresses/:id', to: 'address#destroy'
  end
  scope module: :public do
    get 'orders/new'
    post 'orders/confirm'
    get 'orders/complete'
    post 'orders', to: 'cart_items#create'
    get 'orders', to: 'cart_items#index'
    get 'orders/:id', to: 'cart_items#show'
  end
  scope module: :public do
    get 'cart_items', to: 'cart_items#index'
    patch 'cart_items/:id', to: 'cart_items#update'
    delete 'cart_items/:id', to: 'cart_items#destroy'
    delete 'cart_items/destroy_all'
    post 'cart_items', to: 'cart_items#create'
  end
  scope module: :public do
    get 'customers/my_page', to: 'customers#show'
    get 'customers/information/edit', to: 'customers#edit'
    patch 'customers/information', to: 'customers#update'
    get 'customers/unsubscribe', to: 'customers#unsubscribe'
    patch 'customers/withdraw', to: 'customers#withdraw'
  end
  scope module: :public do
    get 'items', to: 'items#index'
    get 'items/:id', to: 'items#show'
  end
  scope module: :public do
    root to: 'homes#top'
    get 'about', to: 'homes#about'
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
