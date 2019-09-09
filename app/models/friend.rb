class Friend < ApplicationRecord
	belongs_to :friendship_sender, class_name: "User"
	belongs_to :friendship_recipient, class_name: "User"
end
