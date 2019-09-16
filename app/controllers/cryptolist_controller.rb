class CryptolistController < ApplicationController

  def show

   @n = params[:id]
   url = 'https://api.coinlore.com/api/tickers/?start=' + @n.to_s + '&limit=100'
   @coin_list = api_request(url)
   @n = @n.to_i

   if current_user
     @coin_tab = current_user.crypto_currencies.all

   end
  end

end
