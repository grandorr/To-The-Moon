class UserCrypto < ApplicationRecord
	belongs_to :user
	belongs_to :crypto_currency
end
