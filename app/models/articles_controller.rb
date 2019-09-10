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

	def create
		if Tag.find_by(name: params[:tag]) == nil
			Tag.create(name: params[:tag])
		end
		Article.create(
			title: params[:title],
			content: params[:content],
			user: current_user,
			tag: Tag.find_by(name: params[:tag])
			)
	end

end