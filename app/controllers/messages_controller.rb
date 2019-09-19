class MessagesController < ApplicationController
	
	def new
		@user = User.find(params[:id].to_i)
	end

	def create
		@message = Message.create(
			content: params[:content],
			recipient: User.find(params[:recipient].to_i),
			sender: current_user,
			has_been_read: true,
			conversation: current_user.conversations.find_by(interlocutor: User.find(params[:recipient].to_i))
			)
		if Message.path_to_redirect?(params[:checker], @message)
			redirect_to profile_path(@message.recipient.id)
		else	
			respond_to do |format|
      	format.html { redirect_back(fallback_location: root_path) }
      	format.js { }
    	end
		end
	end

end