Rails.application.routes.draw do

	devise_for :users, path_names: { 
		sign_up: '' #Stop Sign Up
	}

	root to: "orders#index"
  
 	resources :orders

 	get '/completed' => 'orders#completed_order'
 	get '/cancelled' => 'orders#cancelled_order'
 	get '/follow_up' => 'orders#follow_up'
 	get '/packed' => 'orders#packed_order'
 	get '/pending' => 'orders#pending_order'
 	get '/out_of_stock' => 'orders#out_of_stock'
 	get '/statistics' => 'orders#statistics'
 	get '/returned' => 'orders#returned'
 	get '/not_confrimed' => 'orders#not_confrimed_order'
 	get '/incomplete_order' => 'orders#incomplete_order'
 	get '/delivered' => 'orders#delivered'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
