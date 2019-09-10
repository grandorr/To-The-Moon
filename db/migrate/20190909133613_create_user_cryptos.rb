class CreateUserCryptos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_cryptos do |t|
    	t.belongs_to :port_folio, index: true
    	t.belongs_to :crypto_currency, index: true

      t.timestamps
    end
  end
end
