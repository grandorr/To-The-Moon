class LikesController < ApplicationController
	def new
	end

	def create
		if Like.for_comment_or_article?(params[:comment])

			Like.create(
				user: current_user,
				article: Article.find(params[:article].to_i)
				)

		else
			Like.create(
				user: current_user,
				comment: Comment.find(params[:comment].to_i)
				)
		end
		redirect_back(fallback_location: root_path)
	end

	def destroy
		if Like.for_comment_or_article?(params[:article])
			if params[:id] == nil
				current_user.likes.find_by(article: params[:article]).destroy
			else
				Like.find(params[:id]).destroy
			end
		else
			current_user.likes.find_by(comment: params[:comment]).destroy
		end
		redirect_back(fallback_location: root_path)
	end

end
