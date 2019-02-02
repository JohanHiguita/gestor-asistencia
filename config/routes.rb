Rails.application.routes.draw do



	# get 'facilitadores/index'
	# get 'facilitadores/show'
	# get 'facilitadores/destroy'

	root to: "students#index"
	get '/class_sessions/find/students_selection', to: 'class_sessions#students_selection'


	#--Role Admin routes:
	get 'admin/index'
	# get 'admin/facilitador/:id', to: 'admin#show_facilitador', as: 'facilitador'
	# delete "admin/facilitador/:id", to: 'admin#destroy_facilitador'
	#resources :schools
	scope '/admin' do
		resources :facilitadors, only: [:index, :show, :destroy]
		resources :schools
	end


	#--Role Facilitadores routes:
	resources :students	
	resources :class_sessions


	#--Devise routes:
	devise_for :users, path: 'facilitadores', controllers: { sessions: "users/sessions"}
	devise_for :admin, path: 'admin', controllers: { sessions: "admin/sessions"}


end
