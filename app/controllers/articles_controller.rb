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
		if current_user
			current_user.articles.each do |article|
				if article == @article
						Comment.has_been_read?(@comments)
				end
			end
		end
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
		puts params
		@article.update_attributes(
			:title => params[:title],
			:content => params[:content],
			:user => current_user,
			:tag => Tag.find_by(name: params[:tag])
			)

		if params[:picture]
			@article.picture.attach(params[:picture])
		end
		redirect_to articles_path
	end

	def destroy
		Article.find(params[:id]).destroy
		redirect_to articles_path
	end

end
