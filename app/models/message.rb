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
				has_been_read: false,
				conversation: self.recipient.conversations.find_by(interlocutor: self.sender)
				)
			end
		else
			Message.create(
				content: self.content,
				recipient: self.recipient,
				sender: self.sender,
				has_been_read: false,
				conversation: self.recipient.conversations.find_by(interlocutor: self.sender)
				)
		end
	end

	# Checks if the user's messages includes unread messages and updates its status if so

	def self.has_been_read?(messages)
		messages.each do |message|
			if message.has_been_read == false
				message.update_attribute(:has_been_read, true)
			end
		end
	end

end
