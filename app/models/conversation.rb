class Conversation < ApplicationRecord
	belongs_to :user
	belongs_to :interlocutor, class_name: "User"
	has_many :messages

end
