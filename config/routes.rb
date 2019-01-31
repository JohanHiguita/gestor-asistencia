Rails.application.routes.draw do


  
  #get 'finders/students_selection'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root to: "students#index"
	get '/class_sessions/find/students_selection', to: 'class_sessions#students_selection'
	get 'admin/index'
	resources :students	
	resources :schools
	resources :class_sessions
	devise_for :users, path: 'facilitadores', controllers: { sessions: "users/sessions"}
	devise_for :admin, path: 'admin', controllers: { sessions: "admin/sessions"}
	#devise_for :users, path: 'facilitadores'
	#devise_for :admin, path: 'admin'

	# namespace :admin do
	# 	resources :articles, :comments
	# end 




end
