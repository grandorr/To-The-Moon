class CryptoCurrency < ApplicationRecord
	has_many :user_cryptos
	has_many :users, through: :user_cryptos, foreign_key: 'crypto_id'


end
