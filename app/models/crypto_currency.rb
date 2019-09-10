class CryptoCurrency < ApplicationRecord
	has_many :user_cryptos
	has_many :port_folios, through: :user_cryptos, foreign_key: 'crypto_id'
end
