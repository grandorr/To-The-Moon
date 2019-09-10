class UserCryptosController < ApplicationController
	
	def index
		@cryptos = current_user.crypto_currencies
		@user_cryptos = current_user.user_cryptos
	end

	def update
		current_user.user_cryptos.find(params[:id]).update_attribute(:quantity, params[:quantity])
		redirect_back(fallback_location: root_path)
	end

	def destroy
		current_user.user_cryptos.find(params[:id]).destroy
		redirect_back(fallback_location: root_path)
	end

end
