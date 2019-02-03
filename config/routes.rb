Rails.application.routes.draw do


  # get 'admin_class_sessions/index'
  # get 'admin_class_sessions/show'
	root to: "students#index"
	get '/class_sessions/find/students_selection', to: 'class_sessions#students_selection'


	#--Role Admin routes:
	get 'admin/index'
	scope '/admin' do
		resources :facilitadors, only: [:index, :show, :destroy]
		resources :schools
		resources :admin_class_sessions, only: [:index, :show]
	end


	#--Role Facilitadores routes:
	resources :students	
	resources :class_sessions
	#---- Generate Attendance
	#resources :attendances, only: [:show_modal]
	get '/attendances', to: 'attendances#show_modal'
	post '/attendances', to: 'attendances#download_xls'


	#--Devise routes:
	devise_for :users, path: 'facilitadores', controllers: { sessions: "users/sessions"}
	devise_for :admin, path: 'admin', controllers: { sessions: "admin/sessions"}


end
