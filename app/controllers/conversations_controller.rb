class ConversationsController < ApplicationController
	def show
		@conversation = Conversation.find(params[:id])
		@messages = @conversation.messages
		Message.has_been_read?(@messages)
	end

end
