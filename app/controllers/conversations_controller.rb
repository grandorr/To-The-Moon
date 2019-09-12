class ConversationsController < ApplicationController

	def show
		@conversation = Conversation.find(params[:id])
		@messages = @conversation.messages
		@messages.each do |message|
			if message.has_been_read == false
				message.update_attribute(:has_been_read, true)
			end
		end
	end

end
