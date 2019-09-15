class UserCryptosController < ApplicationController

	before_action :authenticate_user!

	def index
			crypto_array = get_coin
		  @coin = crypto_array[0]
		  @cryto_currency = crypto_array[1]
	end


	def create
		@n = params[:n].to_i
		crypto_currency = CryptoCurrency.crypto_exists?(params[:name],  params[:id])
		UserCrypto.create(
			user: current_user,
			crypto_currency: crypto_currency,
			quantity: 0
		)
		respond_to do |format|
    	format.html { redirect_back(fallback_location: root_path) }
    	format.js { }
  	end
	end

	def update
		crypto_currency = CryptoCurrency.find_by(crypto_id: params[:id])
		quantity = UserCrypto.check_quantity(params[:quantity].to_i)	
		current_user.user_cryptos.find_by(crypto_currency: crypto_currency).update_attribute(:quantity, quantity)
		redirect_back(fallback_location: root_path)
	end

	def destroy
		current_user.user_cryptos.find(params[:id]).destroy
		redirect_back(fallback_location: root_path)
	end

end
