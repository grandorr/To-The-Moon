class ApplicationController < ActionController::Base
  require 'net/http'
  def api_request(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    return response
  end

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

  
end
