class UserCrypto < ApplicationRecord

	belongs_to :user
	belongs_to :crypto_currency

	def self.check_quantity(quantity)
		if quantity <= 0
			return 0
		else
			return quantity
		end
	end

end
