class FriendRequestsController < ApplicationController
	
	def new
	end

	def create
		puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		puts(params)
		puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		@user = User.find(params[:user].to_i)
		FriendRequest.create(
			user: @user,
			pending_friend: current_user
			)
		redirect_to profile_path(@user.id)
	end

end