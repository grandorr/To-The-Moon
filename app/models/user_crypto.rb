class UserCrypto < ApplicationRecord
	belongs_to :port_folio
	belongs_to :crypto_currency
end
