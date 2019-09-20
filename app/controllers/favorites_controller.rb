class FavoritesController < ApplicationController

	def create
		@article = Article.find(params[:article].to_i)
		Favorite.create(
			favorite_article: Article.find(params[:article]),
			interested_user: current_user
		)
		respond_to do |format|
    	format.html { redirect_back(fallback_location: root_path) }
    	format.js { }
  	end
	end

	def destroy
		@article = Article.find(params[:id].to_i)
		current_user.favorites.find_by(favorite_article: params[:id]).destroy
		respond_to do |format|
    	format.html { redirect_back(fallback_location: root_path) }
    	format.js { }
  	end
	end
end
