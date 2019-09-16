class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		Comment.create(
			content: params[:content],
			user: current_user,
			article: Article.find(params[:article])
			)
		redirect_back(fallback_location: root_path)
	end

	def edit
		@comment = Comment.find(params[:id])
	end
	
	def update
		@comment = Comment.find(params[:id])
		@comment.update_attribute(:content, params[:content])
		redirect_to article_path(@comment.article.id)
	end

	def destroy
		Comment.find(params[:id]).destroy
		redirect_back(fallback_location: root_path)
	end
end
