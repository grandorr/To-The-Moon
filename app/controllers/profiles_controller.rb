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
		@senders = []
		@unread_messages = 0
		@messages.each do |message|
			if message.has_been_read == false
				@senders.append(message.sender.email)
				@unread_messages += 1
			end
		end
		@senders = @senders.uniq
		@favorite_articles = current_user.favorite_articles
	end

end