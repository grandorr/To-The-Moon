class ArticlesController < ApplicationController
		before_action :authenticate_user!, except: [:show,:index]
	
	def index
		@research = params
		unless Article.check_if_research(@research)
			@articles = Article.all.reverse
		else
			@articles = Article.make_research(@research)
		end
	end

	def show
		@article = Article.find(params[:id])
		@tag = @article.tag
		@user = @article.user
		@comments = @article.comments
	end

	def create
		Article.tag_exists?(params[:tag])
		@article = Article.create(
			title: params[:title],
			content: params[:content],
			user: current_user,
			tag: Tag.find_by(name: params[:tag])
		)
		@article.picture.attach(params[:picture])
		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
		@tag = @article.tag.name

	end

	def update
		Article.tag_exists?(params[:tag])
		@article = Article.find(params[:id])
		@article.update_attributes(
			:title => params[:title], 
			:content => params[:content], 
			:user => current_user, 
			:tag => Tag.find_by(name: params[:tag])
			)
		redirect_to articles_path
	end

	def destroy
		Article.find(params[:id]).destroy
	end

end
