class Conversation < ApplicationRecord
	belongs_to :user
	belongs_to :interlocutor, class_name: "User"
	has_many :messages

	after_create :reciprocal_conversation

	def reciprocal_conversation
		if self.interlocutor.conversations.last != nil && self.interlocutor.conversations.last.user == self.user
			@user = self.interlocutor
			@interlocutor = self.user
			Conversation.create(user: @user, interlocutor: @interlocutor)
		elsif self.interlocutor.conversations.last == nil
			@user = self.interlocutor
			@interlocutor = self.user
			Conversation.create(user: @user, interlocutor: @interlocutor)
		end
	end

end
