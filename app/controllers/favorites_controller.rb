class FavoritesController < ApplicationController
	def create
		Favorite.create(
			favorite_article: Article.find(params[:article]),
			interested_user: current_user
			)
		redirect_back(fallback_location: root_path)
	end

	def destroy
		current_user.favorites.find_by(favorite_article: params[:article]).destroy
		redirect_back(fallback_location: root_path)
	end
end
