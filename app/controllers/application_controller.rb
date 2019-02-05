class ApplicationController < ActionController::Base

	protect_from_forgery with: :null_session

	def after_sign_in_path_for(resource)
		stored_location_for(resource) ||
		if resource.is_a?(Admin)
			#byebug 
			facilitadors_path

		else
			root_path
		end
	end


	# def after_sign_out_path_for(resource_or_scope)
	# 	new_admin_session_path
	# end
	# def after_sign_out_path_for(resource_or_scope)

	# 	if resource_or_scope.is_a?(User) 
	# 		new_user_session_path
	# 	elsif resource_or_scope.is_a?(Admin)	
	# 		new_user_admin_path
	# 	end

	# end
end
