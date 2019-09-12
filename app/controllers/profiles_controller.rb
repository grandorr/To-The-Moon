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
		@conversations = @user.conversations
		@messages = @user.received_messages
		@new_messages = []
		@messages.each do |message|
			if message.has_been_read == false
				@new_messages.append(message)
			end
		end
	end

end