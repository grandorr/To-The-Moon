class ConversationsController < ApplicationController
	before_action :authenticate_user!
	
	def show
		@conversation = Conversation.find(params[:id])
		@messages = @conversation.messages
		Message.has_been_read?(@messages)
	end

end
