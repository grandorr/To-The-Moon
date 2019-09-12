class Friendship < ApplicationRecord
	belongs_to :user
	belongs_to :friend, class_name: "User"

	after_create :reciprocal_friendship

	def reciprocal_friendship
		unless self.friend.friends.include? self.user 
			@user = self.friend
			@friend = self.user
			Conversation.create(user: @user, interlocutor: @friend)
			Conversation.create(user: @friend, interlocutor: @user)
			Friendship.create(user: @user, friend: @friend)

		end
	end

end
