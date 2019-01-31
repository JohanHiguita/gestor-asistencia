class ApplicationController < ActionController::Base

	protect_from_forgery with: :null_session

# 	def after_sign_in_path_for(resource)
# 		stored_location_for(resource) ||
# 		if resource.is_a?(Admin) 
# 			"www.google.com"
# 		end
#     #   super
#     # end
# end
end
