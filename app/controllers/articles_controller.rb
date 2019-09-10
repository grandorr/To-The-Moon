class ArticlesController < ApplicationController
	def index
		unless params[:content] == nil
			@articles = Article.where(tag: Tag.find_by(name:params[:content]))
		else
			@articles = Article.all
		end
	end

	def show
		@article = Article.find(params[:id])
		@tag = @article.tag
	end
end
