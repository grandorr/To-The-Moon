class FriendshipsController < ApplicationController
	def create
		Friendship.create(
			user: current_user,
			friend: User.find(params[:friend_id])
			)
		current_user.friend_requests.find_by(pending_friend: User.find(params[:friend_id])).destroy
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@friendship = Friendship.find(params[:id].to_i)
		@user = @friendship.user
		@friend = @friendship.friend
		@reciprocal_friendship = Friendship.find_by(user: @friend, friend: @user)
		@friendship.destroy
		@reciprocal_friendship.destroy
		redirect_back(fallback_location: root_path)
	end

end