Rails.application.routes.draw do

  namespace :admin do
    get 'order_details/:id', to: 'order_details#update'
  end
  namespace :admin do
    get 'orders/:id', to: 'orders#show'
    get 'orders/:id', to: 'orders#update'
  end
  namespace :admin do
    get 'customers', to: 'customers#index'
    get 'customers/:id', to: 'customers#show'
    get 'customers/:id/edit', to: 'customers#edit'
    get 'customers/:id', to: 'customers#update'
  end
  namespace :admin do
    get 'genres', to: 'genres#index'
    get 'genres', to: 'genres#create'
    get 'genres/:id/edit', to: 'genres#edit'
    get 'genres/:id', to: 'genres#update'
  end
  namespace :admin do
    get 'items', to: 'items#index'
    get 'items/new'
    get 'items', to: 'items#create'
    get 'items/:id', to: 'items#show'
    get 'items/:id/edit', to: 'items#edit'
    get 'items/:id', to: 'items#update'
  end
  namespace :admin do
    root to: 'homes#top'
  end
  scope module: :public do
    get 'addresses', to: 'address#index'
    get 'addresses/:id/edit', to: 'address#edit'
    get 'addresses', to: 'address#create'
    get 'addresses/:id', to: 'address#update'
    get 'addresses/:id', to: 'address#destroy'
  end
  scope module: :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/complete'
    get 'orders', to: 'cart_items#create'
    get 'orders', to: 'cart_items#index'
    get 'orders/:id', to: 'cart_items#show'
  end
  scope module: :public do
    get 'cart_items', to: 'cart_items#index'
    get 'cart_items/:id', to: 'cart_items#update'
    get 'cart_items/:id', to: 'cart_items#destroy'
    get 'cart_items/destroy_all'
    get 'cart_items', to: 'cart_items#create'
  end
  scope module: :public do
    get 'customers/my_page', to: 'customers#show'
    get 'customers/information/edit', to: 'customers#edit'
    get 'customers/information', to: 'customers#update'
    get 'customers/unsubscribe', to: 'customers#unsubscribe'
    get 'customers/withdraw', to: 'customers#withdraw'
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
