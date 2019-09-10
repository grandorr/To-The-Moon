class FriendshipsController < ApplicationController
	def create
		Friendship.create(
			user: current_user,
			friend: User.find(params[:friend_id])
			)
		current_user.friend_requests.find_by(pending_friend: User.find(params[:friend_id])).destroy
	end
end