class CryptolistController < ApplicationController
  def show
    if current_user
        @coin_tab = current_user.crypto_currencies.all
    end
    @n = params[:id]
    @n = @n.to_i
  end
end
