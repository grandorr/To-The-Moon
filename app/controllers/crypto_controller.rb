class CryptoController < ApplicationController
  
  def index
  end

  def show
  	
    @coin_symbol = params[:symbol]
    @coin_id = params[:id]
    @coin_name = params[:name]

  end
end
