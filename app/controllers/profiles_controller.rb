class ProfilesController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@articles = @user.articles
		@articles = @articles.reverse
		@pending_friends = current_user.pending_friends
		@friends = current_user.friends
		@friendship = current_user.friendships.find_by(friend: @user)
	end

end