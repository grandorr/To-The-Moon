class FavoritesController < ApplicationController

	def create
		@article = Article.find(params[:article].to_i)
		Favorite.create(
			favorite_article: Article.find(params[:article]),
			interested_user: current_user
		)
		redirect_back(fallback_location: root_path) 
	end

	def destroy
		@article = Article.find(params[:id].to_i)
		current_user.favorites.find_by(favorite_article: params[:id]).destroy
		redirect_back(fallback_location: root_path)
	end
end
