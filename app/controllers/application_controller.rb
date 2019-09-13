class ApplicationController < ActionController::Base
  require 'net/http'
  def api_request(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    return response
  end
end
