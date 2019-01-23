Rails.application.routes.draw do

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root to: "students#index"
	get '/class_sessions/find/students_selection', to: 'class_sessions#students_selection'

	resources :students	
	resources :schools
	resources :class_sessions
	devise_for :users

	# namespace :admin do
	# 	resources :articles, :comments
	# end 




end
