class CryptolistController < ApplicationController
  def show
    @n = params[:id]
    @n = @n.to_i
  end
end
