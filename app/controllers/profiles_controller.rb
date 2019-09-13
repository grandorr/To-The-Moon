class ProfilesController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@articles = @user.articles.reverse
		@pending_friends = current_user.pending_friends
		@friends = current_user.friends
		@friendship = current_user.friendships.find_by(friend: @user)
		@conversations = @user.conversations
		@messages = @user.received_messages
		message_infos = User.has_unread_messages?(@messages)
		@senders = message_infos[0]
		@unread_messages = message_infos[1]
		@favorite_articles = current_user.favorite_articles
	end

end