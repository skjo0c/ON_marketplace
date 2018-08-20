Rails.application.routes.draw do
	
	root 'items#index'
	
	resources :items

	# post '/add_to_cart/:item_id' => 'carts#add_to_cart', :as => 'add_to_cart'
	
	get '/cart', to: 'order_items#index'
	resources :order_items, path: '/cart/order_items'
	get '/cart/checkout', to: 'orders#new', as: :checkout
	patch '/cart/checkout', to: 'orders#create'

	get '/ordered_items', to: 'orders#show', as: :vieworders

	devise_for :admins
	devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
