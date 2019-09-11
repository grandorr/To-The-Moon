class ArticlesController < ApplicationController
	def index
		if params[:content] == nil || params[:content] == ""
			@articles = Article.all
			@articles = @articles.reverse
		else
			@articles = Article.where(tag: Tag.find_by(name:params[:content]))
			@articles = @articles.reverse
		end
	end

	def show
		@article = Article.find(params[:id])
		@tag = @article.tag
		@user = @article.user
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


	def article_params
	  params.require(:@article).permit(:picture)
	end

end
