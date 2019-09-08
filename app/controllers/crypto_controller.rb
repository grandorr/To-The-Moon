class CryptoController < ApplicationController
  def index
    @request = CoinMarketCap.request(options: {limit: [0], start: 0})

    if @request == nil
      @request1 =  Cryptocompare::CoinList.all["Data"]
    else
      @request += CoinMarketCap.request(options: {limit: [0], start: 100})
      @request += CoinMarketCap.request(options: {limit: [0], start: 200})
    end

    @coinlists = Cryptocompare::CoinList.all["Data"].sort.to_h


  end

  def show
    @request = CoinMarketCap.request(options: {currency: params[:id]})

  end
end
