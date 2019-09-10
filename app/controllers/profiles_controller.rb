class ProfilesController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@articles = @user.articles
		@pending_friends = current_user.pending_friends
	end

end