class LikesController < ApplicationController
	def new
	end

	def create
		if params[:comment] == nil
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
		redirect_to article_path(params[:article].to_i)
	end

	def destroy
		if params[:article] == nil
			current_user.likes.find_by(article: params[:article]).destroy
		else
			current_user.likes.find_by(comment: params[:comment]).destroy
		end
		redirect_to article_path(params[:article].to_i)
	end
end
