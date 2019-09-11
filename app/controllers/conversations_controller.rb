class ConversationsController < ApplicationController

	def show
		@conversation = Conversation.find(params[:id])
		@messages = @conversation.messages
	end

end
