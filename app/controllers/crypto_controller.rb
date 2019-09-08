class CryptoController < ApplicationController
  def index
    @request = CoinMarketCap.request(options: {limit: [0], start: 0})
  end

  def show
  end
end
