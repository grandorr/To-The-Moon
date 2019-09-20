class FriendshipsController < ApplicationController
	
	before_action :authenticate_user!

	def create
		@n = params[:n].to_i
		@friendship = Friendship.create(
			user: current_user,
			friend: User.find(params[:friend_id])
			)
		FriendRequest.destroy_friend_request(current_user, params[:friend_id])		
		redirect_back(fallback_location: root_path) 
	end

	def destroy
		Friendship.reciprocal_destruction(params[:id].to_i)
		redirect_back(fallback_location: root_path)
	end

end