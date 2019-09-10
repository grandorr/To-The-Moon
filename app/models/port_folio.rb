class PortFolio < ApplicationRecord
	belongs_to :user
	has_many :user_cryptos
	has_many :crypto_currencies, through: :user_cryptos, foreign_key: 'port_folio_id'
	
end
