class UserCryptosController < ApplicationController
	before_action :authenticate_user!
	def index
		@cryptos = current_user.crypto_currencies
		@user_cryptos = current_user.user_cryptos
	end

	def create
		unless CryptoCurrency.where(name: params[:name]).length == 0
			UserCrypto.create(
				user: current_user,
				crypto_currency: CryptoCurrency.find_by(name: params[:name]),
				quantity: 0
				)
		else
			@crypto =	CryptoCurrency.create(
				name: params[:name],
				crypto_id: params[:id]
				)
			UserCrypto.create(
				user: current_user,
				crypto_currency: @crypto,
				quantity: 0

				)
		end

	end

	def update

		crypto_currency = CryptoCurrency.find_by(crypto_id: params[:id])
		current_user.user_cryptos.find_by(crypto_currency: crypto_currency).update_attribute(:quantity, params[:quantity])
		

		redirect_back(fallback_location: root_path)
	end

	def destroy
		current_user.user_cryptos.find(params[:id]).destroy
		redirect_back(fallback_location: root_path)
	end

end
