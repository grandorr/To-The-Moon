class CryptoCurrency < ApplicationRecord
	has_many :user_cryptos
	has_many :users, through: :user_cryptos, foreign_key: 'crypto_id'

	def self.crypto_exists?(name, id)
		unless CryptoCurrency.where(name: name).length == 0
			crypto = CryptoCurrency.find_by(name: name)
		else
			crypto =	CryptoCurrency.create(
				name: name,
				crypto_id: id
				)
		end
		return crypto
	end

end
