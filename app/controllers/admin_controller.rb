class AdminController < ApplicationController

	def index
		#cuando se loguea el admin lo está mandando para acá
		redirect_to facilitadors_path
	end



end
