Rails.application.routes.draw do

  # customer側ルーティング
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  scope module: :public do
     root 'homes#top'
     resources :items, only: [:show, :index]
     get 'about' => 'homes#about'
     patch 'customers/withdraw' => 'customers#withdraw', as: 'customers_withdraw'
     get 'custormers/unsubscribe' => 'customers#unsubscribe'
     get 'customers/mypage' => 'customers#show'
     get 'customers/edit' => 'customers#edit'
     patch 'customers' => 'customers#update'
     get 'orders/about' => 'orders#about', as: 'orders_about'
     get 'orders/confirm' => 'orders#confirm'
     get 'orders/thanx' => 'orders#thanx'
     resources :orders, only: [:create, :new, :index, :show]
     delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
     resources :cart_items, only: [:index, :create, :update, :destroy]
     resources :shipping_addresses, only: [:index, :create, :destroy, :edit, :update]
   end

  # admin側ルーティング
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
   root :to => 'homes#top'
   resources :customers, only: [:index, :edit, :update, :show]
   resources :genres, only: [:index, :create, :edit, :update]
   resources :items, only: [:show, :index, :new, :create, :edit, :update]
   resources :orders, only: [:index, :show, :update]
   resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end