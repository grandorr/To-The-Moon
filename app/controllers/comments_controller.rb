class CommentsController < ApplicationController
	def create
		Comment.create(
			content: params[:content],
			user: current_user,
			article: Article.find(params[:article])
			)
		redirect_back(fallback_location: root_path)
	end

	def destroy
		Comment.find(params[:id]).destroy
		redirect_back(fallback_location: root_path)
	end
end
