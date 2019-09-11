class CryptoController < ApplicationController
  def index

  end
  def index2
  end


  def show
    @coin_symbol = params[:symbol]
    @coin_id = params[:id]
    @coin_name = params[:name]

    puts params

  end
end
