class MessagesController < ApplicationController
	
	def new
		@user = User.find(params[:id].to_i)
	end

	def create
		@message = Message.create(
			content: params[:content],
			recipient: User.find(params[:recipient].to_i),
			sender: current_user
			)

	end

end