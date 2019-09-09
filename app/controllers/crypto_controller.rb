class CryptoController < ApplicationController
  def index
    @request = CoinMarketCap.request(options: {limit: [0], start: 0})

    if @request == nil
      @request1 =  Cryptocompare::CoinList.all["Data"]
  end




  end

  def show


  end
end
