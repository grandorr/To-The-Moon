class Friendship < ApplicationRecord
	belongs_to :user
	belongs_to :friend, class_name: "User"

	after_create :reciprocal_friendship

	# Creates friendship link on both users regarded and initiates an empty conversation between them

	def reciprocal_friendship
		unless self.friend.friends.include? self.user 
			@user = self.friend
			@friend = self.user
			Conversation.create(user: @user, interlocutor: @friend)
			Conversation.create(user: @friend, interlocutor: @user)
			Friendship.create(user: @user, friend: @friend)
		end
	end

	# Find friendship on both users side and destruct both of them |

	def self.reciprocal_destruction(id)
		friendship = Friendship.find(id)
		user = friendship.user
		friend = friendship.friend
		reciprocal_friendship = Friendship.find_by(user: friend, friend: user)
		friendship.destroy
		reciprocal_friendship.destroy
	end

end
