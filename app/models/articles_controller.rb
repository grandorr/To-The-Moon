class ArticlesController < ApplicationController
	def index
		puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		puts(params[:content])
		puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		@articles = Article.where(tag: Tag.find_by(name:params[:content]))
	end
end