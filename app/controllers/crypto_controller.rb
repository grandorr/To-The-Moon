class CryptoController < ApplicationController
  
  require 'net/http'
  def api_request(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    return response
  end

  def index
  end

  def show

    @coin_id = params[:id]
    @coin_symbol = params[:symbol]   
    @coin_name = params[:name]
    @url = 'https://api.coinlore.com/api/ticker/?id=' + @coin_id
    @coin = api_request(@url)
    @coin.each do |coin|
      if @coin_symbol == nil
        @coin_symbol = coin["symbol"] 
        @coin_name = coin["name"]
      end
    end
  end

end
