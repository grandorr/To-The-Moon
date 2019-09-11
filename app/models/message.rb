class Message < ApplicationRecord
	belongs_to :sender, class_name: "User"
	belongs_to :recipient, class_name: "User"
	belongs_to :conversation

	after_create :reciprocal_message

	def reciprocal_message
		if Message.all.length >= 2
			@message_content = Message.find(self.id - 1).content
			@message_sender = Message.find(self.id - 1).sender
			unless @message_content == self.content && @message_sender == self.sender
				Message.create(
				content: self.content,
				recipient: self.recipient,
				sender: self.sender,
				conversation: self.recipient.conversations.find_by(interlocutor: self.sender)
				)
			end
		else
			Message.create(
				content: self.content,
				recipient: self.recipient,
				sender: self.sender,
				conversation: self.recipient.conversations.find_by(interlocutor: self.sender)
				)
		end
	end
end
