module CryptoHelper

  def price_calculator(percent,price)
    @percent = percent
    @price = price
    if @percent > 0
      @price - ((@price / 100 ) * @percent)
      return @price
    else
      @price + ((@price / 100 ) * @percent)
      return @price
    end
  end

#######################################################

  def api_request(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    return response
  end
end
