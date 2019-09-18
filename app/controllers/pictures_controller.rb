class PicturesController < ApplicationController
  
  def create
	  @article = Article.find(params[:article_id])
	  @article.picture.attach(params[:picture])
	  redirect_to(article_path(@article))
	end
	
end
