class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :article
	has_many :likes

	def self.has_been_read?(messages)
		messages.each do |message|
			if message.has_been_read == false
				message.update_attribute(:has_been_read, true)
			end
		end
	end
end
