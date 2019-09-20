class ConversationsController < ApplicationController
	before_action :authenticate_user!

	def show
		 if Conversation.exists?(id: params[:id])

			@conversation = Conversation.find(params[:id])
			@messages = @conversation.messages
			Message.has_been_read?(@messages)
  	else
			id = params[:id].to_i
			id -= 1
			@conversation = Conversation.find(id)

			@messages = @conversation.messages
			Message.has_been_read?(@messages)
		end
	end

end
