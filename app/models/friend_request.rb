class FriendRequest < ApplicationRecord
	belongs_to :user
	belongs_to :pending_friend, class_name: "User"

	def self.destroy_friend_request(user, friend)
		user.friend_requests.find_by(pending_friend: User.find(friend)).destroy 	
	end 

end
