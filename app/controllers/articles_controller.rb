class ArticlesController < ApplicationController
		before_action :authenticate_user!, except: [:show,:index]
	def index
		if params[:content] == nil || params[:content] == ""
			@articles = Article.all
			@articles = @articles.reverse
		else
			@articles = []
			@find_articles = Article.all
			@find_articles.each do |article|
				if article.tag.name.include? params[:content]
					@articles.append(article)
				elsif article.user.email.include? params[:content]
					@articles.append(article)
				elsif article.content.include? params[:content]
					@articles.append(article)
				elsif article.title.downcase.include? params[:content]
					@articles.append(article)
				end
			end
			#@articles = Article.where(tag: Tag.find_by(name:params[:content]))
			@articles = @articles.reverse
		end
	end


	def new
	end


	def show
		@article = Article.find(params[:id])
		@tag = @article.tag
		@user = @article.user
		@comments = @article.comments
	end

	def create
		if Tag.find_by(name: params[:tag]) == nil
			Tag.create(name: params[:tag])
		end
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
		if Tag.find_by(name: params[:tag]) == nil
			Tag.create(name: params[:tag])
		end
		@article = Article.find(params[:id])
		@article.update_attribute(:title, params[:title])
		@article.update_attribute(:content, params[:content])
		@article.update_attribute(:user, current_user)
		@article.update_attribute(:tag, Tag.find_by(name: params[:tag]))
		@article.picture.attach(params[:picture])

		redirect_to articles_path
	end

	def destroy
		Article.find(params[:id]).destroy
	end




end
