class CryptoCurrency < ApplicationRecord
	has_many :user_cryptos
        # Link crypto currencies to the users owning them through the join model
        # The user_cryptos table already uses `crypto_currency_id` so we don't
        # need to specify a foreign_key here (and using `crypto_id` was wrong)
        has_many :users, through: :user_cryptos

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
