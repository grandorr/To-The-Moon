class Like < ApplicationRecord
	belongs_to :user
	belongs_to :comment, optional: true
	belongs_to :article, optional: true

	# Checks the origin of the request, being either a comment or an article
	
	def self.for_comment_or_article?(source)
		if source == nil
			return true
		else
			return false
		end
	end

end
