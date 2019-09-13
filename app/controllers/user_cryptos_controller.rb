class UserCryptosController < ApplicationController
	before_action :authenticate_user!

def get_coin
	@coin = []
	@crypto_currency = []
	@cryptos = current_user.crypto_currencies
	@cryptos.each do |crypto|
	@crypto_currency << current_user.user_cryptos.find_by(crypto_currency: crypto)
	url = 'https://api.coinlore.com/api/ticker/?id=' + crypto.crypto_id.to_s
	@coin << api_request(url)

	end
	@crypto_array = [@coin,@crypto_currency]
	return @crypto_array
end

	def index
			crypto_array = get_coin
		  @coin = crypto_array[0]
		  @cryto_currency = crypto_array[1] 

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
