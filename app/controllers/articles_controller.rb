class ArticlesController < ApplicationController
	def index

		if params[:content] == nil || params[:content] == ""
			@articles = Article.all
		else
			@articles = Article.where(tag: Tag.find_by(name:params[:content]))
		end

	end

	def new
		
	end

end