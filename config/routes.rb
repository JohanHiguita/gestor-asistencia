Rails.application.routes.draw do

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root to: "students#index"
	

	resources :students	
	resources :schools
	devise_for :users 


end
