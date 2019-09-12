class LikesController < ApplicationController
	def new
	end

	def create
		if params[:article] != nil
			Like.create(
				user: current_user,
				article: Article.find(params[:article].to_i)
				)
		end
		redirect_to article_path(params[:article].to_i)
	end

	def destroy
		if params[:article] != nil
			current_user.likes.find_by(article: params[:article]).destroy
		end
		redirect_to article_path(params[:article].to_i)
	end
end
