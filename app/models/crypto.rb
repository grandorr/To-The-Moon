class Crypto < ApplicationRecord

	require 'net/http'

	def self.api_request(url)
	  uri = URI(url)
	  response = Net::HTTP.get(uri)
	  response = JSON.parse(response)
	  return response
	end

end