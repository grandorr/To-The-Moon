class CryptoCurrenciesController < ApplicationController

  def show
    if current_user
      @coin_tab = current_user.crypto_currencies.all
    end
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts (@n)
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"    
    @n = params[:n]
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
