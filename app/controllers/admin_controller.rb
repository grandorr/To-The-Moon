class AdminController < ApplicationController
	before_action :authenticate_user!
	
	def index
	  if current_user.is_admin != true
	  redirect_to root_path
	  end
	end

	def show
	end


end
