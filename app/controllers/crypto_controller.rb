class CryptoController < ApplicationController
  def index
    @request = CoinMarketCap.request(options: {limit: [0], start: 0})
    if @request == nil
      @request1 =  Cryptocompare::CoinList.all["Data"]
    end

    @coinlists = Cryptocompare::CoinList.all["Data"].sort.to_h


  end

  def show
    @request = CoinMarketCap.request(options: {currency: params[:id].id})
    @fullprice = Cryptocompare::Price.full(params[:id].symbol, 'USD')["RAW"]["BTC"]
  end
end
