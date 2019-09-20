class UserCryptosController < ApplicationController

	before_action :authenticate_user!, :except => [:index]

	def index
		if current_user
		@crypto_array = get_coin
 		@coin = @crypto_array[0]
 		@cryto_currency = @crypto_array[1]
  	end
	end

	def new
		@n = params[:n]
		@id = params[:id].to_i
		respond_to do |format|
    	format.html { redirect_back(fallback_location: root_path) }
    	format.js { }
  	end
	end

	def create
		puts"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		puts params
		puts"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		crypto_currency = CryptoCurrency.find_by(crypto_id: params[:crypto].to_i)
		@n = params[:n].to_i
		quantity = params[:quantity]
		if quantity.include?(",")
			quantity = quantity.gsub(",", ".")
		end
		@crypto = UserCrypto.create(
			user: current_user,
			crypto_currency: crypto_currency,
			quantity: quantity.to_f
		)
		respond_to do |format|
    	format.html { redirect_back(fallback_location: root_path) }
    	format.js { }
  	end
	end

	def update
		crypto_currency = CryptoCurrency.find_by(crypto_id: params[:id])

		quantity = UserCrypto.check_quantity(params[:quantity].to_f)
		@n = params[:n].to_i
		@price = params[:price].to_f
		@quantity = params[:quantity].to_f

		@user_crypto = current_user.user_cryptos.find_by(crypto_currency: crypto_currency)
		@user_crypto.update(quantity: quantity)

		@crypto_name = params[:name]
		respond_to do |format|
    	format.html { redirect_back(fallback_location: root_path) }
    	format.js { }
  	end

	end

	def destroy
		@crypto = params[:crypto]
		@n = params[:n].to_i
		current_user.user_cryptos.find(params[:id]).destroy
		respond_to do |format|
    	format.html { redirect_back(fallback_location: root_path) }
    	format.js { }
  	end
	end

end
