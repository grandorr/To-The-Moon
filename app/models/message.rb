class Message < ApplicationRecord
	belongs_to :sender, class_name: "User"
	belongs_to :recipient, class_name: "User"
	belongs_to :conversation

	before_create :check_for_conversation
	
end
