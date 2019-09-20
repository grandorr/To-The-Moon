class CryptolistController < ApplicationController

  def check_if_research(research)
    if research == nil || research == ""
      return false
    else
      return true
    end
  end

  def show
    @research = params[:content]
    if check_if_research(@research) == true
      @n = params[:id]
      @research = @research.downcase
      @crypto_search_id = CryptoCurrency.find_by(name: @research)
      if @crypto_search_id == nil
        @crypto_search_id = CryptoCurrency.find_by(symbol: @research)
      end
      if @crypto_search_id != nil
        @crypto_search_id = @crypto_search_id.crypto_id
        s_url = 'https://api.coinlore.com/api/ticker/?id=' + @crypto_search_id.to_s
        @coin_list = api_request(s_url)
        if current_user
          @coin_tab = current_user.crypto_currencies.all
        end
      else
        @check_if_research_nil = true
      end
    else
      @n = params[:id]
      url = 'https://api.coinlore.com/api/tickers/?start=' + @n.to_s + '&limit=100'
      @coin_list = api_request(url)
      @n = @n.to_i
      if current_user
        @coin_tab = current_user.crypto_currencies.all
      end
    end
  end

end
