class FriendRequestsController < ApplicationController

	def create
		@user = User.find(params[:user].to_i)
		FriendRequest.create(
			user: @user,
			pending_friend: current_user
			)
		respond_to do |format|
    	format.html { redirect_back(fallback_location: root_path) }
    	format.js { }
  	end

	end

end