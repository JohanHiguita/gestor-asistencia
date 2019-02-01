Rails.application.routes.draw do


	root to: "students#index"
	get '/class_sessions/find/students_selection', to: 'class_sessions#students_selection'

	#Admin routes:
	get 'admin/index'
	get 'admin/facilitador/:id', to: 'admin#show_facilitador', as: 'facilitador'
	delete "admin/facilitador/:id", to: 'admin#destroy_facilitador'
	get 'admin/school/:id', to: 'admin#show_school', as: 'school'

	#Facilitadores routes:
	resources :students	
	resources :schools
	resources :class_sessions

	#Devise routes:
	devise_for :users, path: 'facilitadores', controllers: { sessions: "users/sessions"}
	devise_for :admin, path: 'admin', controllers: { sessions: "admin/sessions"}
	#devise_for :users, path: 'facilitadores'
	#devise_for :admin, path: 'admin'

	# namespace :admin do
	# 	resources :articles, :comments
	# end 




end
